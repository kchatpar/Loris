!function(e){function t(r){if(a[r])return a[r].exports;var i=a[r]={exports:{},id:r,loaded:!1};return e[r].call(i.exports,i,i.exports,t),i.loaded=!0,i.exports}var a={};return t.m=e,t.c=a,t.p="",t(0)}([function(e,t){"use strict";function a(e,t,a,r){if(loris.hiddenHeaders.indexOf(e)>-1)return null;var i={};r.forEach(function(e,t){i[e]=a[t]},this);var o,l,n,s={color:"#FFFFFF"},c=i.PatientName,d=i.SeriesUID;if("Resolution Status"===e){switch(i["Resolution Status"]){case"unresolved":o="label-danger",l="Unresolved";break;case"reran":o="label-success",l="Reran";break;case"emailed":o="label-info",l="Emailed site/pending";break;case"rejected":o="label-danger",l="Rejected";break;case"inserted":o="label-warning",l="Inserted";break;case"other":o="label-primary",l="Other";break;case"inserted_flag":o="label-default",l="Inserted with flag"}return React.createElement("td",{className:o,style:s},l)}return"Problem"===e&&"Protocol Violation"===i.Problem?(n=loris.BaseURL+"/mri_violations/?submenu=mri_protocol_check_violations&PatientName="+c+"&SeriesUID="+d,React.createElement("td",null,React.createElement("a",{href:n,className:"mri_violations",id:"mri_protocol_check_violations","data-patientname":c,"data-seriesuid":d},"Protocol Violation"))):"Problem"===e&&"Could not identify scan type"===i.Problem?(n=loris.BaseURL+"/mri_violations/?submenu=mri_protocol_violations&PatientName="+c+"&SeriesUID="+d,React.createElement("td",null,React.createElement("a",{href:n,className:"mri_violations",id:"mri_protocol_violations","data-patientname":c,"data-seriesuid":d},"Could not identify scan type"))):React.createElement("td",null,t)}Object.defineProperty(t,"__esModule",{value:!0}),window.formatColumn=a,t.default=a}]);