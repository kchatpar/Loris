import React, {Component} from 'react';
import PropTypes from 'prop-types';
import {Link} from 'react-router-dom';

import Globals from './globals';
import ContainerDisplay from './containerDisplay';
import ContainerCheckout from './containerCheckout';

/**
 * Biobank Container
 *
 * Fetches data corresponding to a given Container from Loris backend and
 * displays a page allowing viewing of meta information of the container
 *
 * @author Henri Rabalais
 * @version 1.0.0
 *
 * */
class BiobankContainer extends Component {
  constructor() {
    super();
    this.drag = this.drag.bind(this);
  }

  drag(e) {
    const container = JSON.stringify(this.props.data.containers.all[e.target.id]);
    e.dataTransfer.setData('text/plain', container);
  }

  getParentContainerBarcodes(barcodes, container) {
    barcodes.push(container.barcode);

    const parent = Object.values(this.props.data.containers.nonPrimary).find(
      (c) => container.parentContainerId == c.id
    );

    parent && this.getParentContainerBarcodes(barcodes, parent);

    return barcodes.slice(0).reverse();
  }

  render() {
    const {current, data, editable, errors, options, target} = this.props;
    const parentBarcodes = this.getParentContainerBarcodes([], target.container);
    // TODO: try to introduce a specimen 'address' here. Aks Sonia for more details
    // on this feature

    const checkoutButton = () => {
      if (!(loris.userHasPermission('biobank_container_update') &&
          options.container.coordinates[target.container.id])) {
        return;
      }

      return (
        <div style = {{marginLeft: 'auto', height: '10%', marginRight: '10%'}}>
          <div
            className={!editable.containerCheckout && !editable.loadContainer ?
              'action-button update open' : 'action-button update closed'}
            title='Checkout Child Containers'
            onClick={()=>{
              this.props.edit('containerCheckout');
            }}
          >
            <span className='glyphicon glyphicon-share'/>
          </div>
        </div>
      );
    };

    // delete values that are parents of the container
    const barcodes = this.props.mapFormOptions(data.containers.all, 'barcode');
    Object.keys(parentBarcodes).forEach((key) => {
      Object.keys(barcodes).forEach((i) => {
        if (parentBarcodes[key] == barcodes[i]) {
          delete barcodes[i];
        }
      });
    });

    // FIXME: This is very VERY messy.
    const barcodePath = Object.keys(parentBarcodes).map((i) => {
      const container = Object.values(data.containers.all).find((container) => {
        return container.barcode == parentBarcodes[parseInt(i)+1];
      });
      let coordinateDisplay;
      if (container) {
        const parentContainer = data.containers.all[container.parentContainerId];
        const dimensions = options.container.dimensions[parentContainer.dimensionId];
        let coordinate;
        let j = 1;
        outerloop:
        for (let y=1; y<=dimensions.y; y++) {
          innerloop:
          for (let x=1; x<=dimensions.x; x++) {
            if (j == container.coordinate) {
              if (dimensions.xNum == 1 && dimensions.yNum == 1) {
                coordinate = x + (dimensions.x * (y-1));
              } else {
                const xVal = dimensions.xNum == 1 ? x : String.fromCharCode(64+x);
                const yVal = dimensions.yNum == 1 ? y : String.fromCharCode(64+y);
                coordinate = yVal+''+xVal;
              }
              break outerloop;
            }
            j++;
          }
        }
        coordinateDisplay = ' ['+coordinate+']';
      }
      return (
        <span className='barcodePath'>
          {i != 0 && ': '}
          <Link key={i} to={`/barcode=${parentBarcodes[i]}`}>{parentBarcodes[i]}</Link>
          {coordinateDisplay}
        </span>
      );
    });

    const containerDisplay = (
      <div className='display-container'>
        {checkoutButton()}
        <ContainerDisplay
          history={this.props.history}
          data={data}
          target={target}
          barcodes={barcodes}
          container={current.container}
          current={current}
          options={options}
          dimensions={options.container.dimensions[target.container.dimensionId]}
          coordinates={options.container.coordinates[target.container.id] ?
          options.container.coordinates[target.container.id] : null}
          editable={editable}
          edit={this.props.edit}
          clearAll={this.props.clearAll}
          setCurrent={this.props.setCurrent}
          setCheckoutList={this.props.setCheckoutList}
          mapFormOptions={this.props.mapFormOptions}
          editContainer={this.props.editContainer}
          updateContainer={this.props.updateContainer}
        />
        <div style={{display: 'inline'}}>
          {barcodePath}
        </div>
      </div>
    );

    const containerList = () => {
      if (!target.container.childContainerIds) {
        return <div className='title'>This Container is Empty!</div>;
      }
      const childIds = target.container.childContainerIds;
      let listAssigned = [];
      let coordinateList = [];
      let listUnassigned = [];
      childIds.forEach((childId) => {
        if (!loris.userHasPermission('biobank_specimen_view')) {
          return;
        }

        const child = data.containers.all[childId];
        if (child.coordinate) {
          listAssigned.push(
            <div><Link key={childId} to={`/barcode=${child.barcode}`}>{child.barcode}</Link></div>
          );
          coordinateList.push(<div>at {child.coordinate}</div>);
        } else {
          listUnassigned.push(
            <Link
              key={childId}
              to={`/barcode=${child.barcode}`}
              id={child.id}
              draggable={true}
              onDragStart={this.drag}
            >
              {child.barcode}
            </Link>
          );
        }
      });

      return (
        <div>
          <div className='title'>
            {listAssigned.length !== 0 ? 'Assigned Containers' : null}
          </div>
          <div className='container-coordinate'>
            <div>{listAssigned}</div>
            <div style={{paddingLeft: 10}}>{coordinateList}</div>
          </div>
            {listAssigned.length !==0 ? <br/> : null}
          <div className='title'>
            {listUnassigned.length !== 0 ? 'Unassigned Containers' : null}
          </div>
          {listUnassigned}
        </div>
      );
    };

    return (
      <div id='container-page'>
        <div className="container-header">
          <div className='container-title'>
            <div className='barcode'>
              Barcode
              <div className='value'>
                <strong>{target.container.barcode}</strong>
              </div>
            </div>
            <ContainerCheckout
              container={target.container}
              current={current}
              editContainer={this.props.editContainer}
              setContainer={this.props.setContainer}
              updateContainer={this.props.updateContainer}
            />
          </div>
        </div>
        <div className='summary'>
          <Globals
            container={current.container}
            data={data}
            editable={editable}
            errors={errors}
            target={target}
            options={options}
            edit={this.props.edit}
            clearAll={this.props.clearAll}
            mapFormOptions={this.props.mapFormOptions}
            editContainer={this.props.editContainer}
            setContainer={this.props.setContainer}
            updateContainer={this.props.updateContainer}
          />
          {containerDisplay}
          <div className='container-list'>
            {containerList()}
          </div>
        </div>
      </div>
    );
  }
}

BiobankContainer.propTypes = {
  containerPageDataURL: PropTypes.string.isRequired,
};

export default BiobankContainer;
