/*Container*/
INSERT INTO biobank_unit (Label)
VALUES 	('µL'), 
        ('10⁶/mL'), 
        ('mL')
;

INSERT INTO biobank_container_capacity (Quantity, UnitId)
VALUES 	(10, (select UnitID from biobank_unit where Label='mL')),
        (1000, (select UnitID from biobank_unit where Label='µL'))
;

INSERT INTO biobank_container_dimension (X, XNumerical, Y, YNumerical, Z, ZNumerical)
VALUES 	(1, 1, 5, 1, 1, 1),
        (6, 1, 1, 1, 1, 1),
        (4, 1, 4, 1, 1, 1),
        (1, 1, 3, 1, 1, 1),
        (4, 1, 1, 1, 1, 1),
        (6, 1, 4, 1, 1, 1),
        (10, 0, 10, 1, 1, 1)
;

INSERT INTO biobank_container_type (Brand, ProductNumber, Label, `Primary`, ContainerCapacityID, ContainerDimensionID)
VALUES 	('FreezerCo.', '##1', 'Freezer - 5 Shelf', 0, NULL,
          (select ContainerDimensionID from biobank_container_dimension where X=1 and Y=5 and Z=1)),
        ('ShelfCo.', '##1', 'Shelf - 6 Rack', 0, NULL,
          (select ContainerDimensionID from biobank_container_dimension where X=6 and Y=1 and Z=1)),
        ('RackCo.', '##1', 'Rack - 16 Box', 0, NULL,
          (select ContainerDimensionID from biobank_container_dimension where X=4 and Y=4 and Z=1)),
        ('FreezerCo.', '##2', 'Freezer - 3 Shelf', 0, NULL,
          (select ContainerDimensionID from biobank_container_dimension where X=1 and Y=3 and Z=1)),
        ('ShelfCo.', '##2', 'Shelf - 4 Rack', 0, NULL,
          (select ContainerDimensionID from biobank_container_dimension where X=4 and Y=1 and Z=1)),
        ('RackCo.', '##2', 'Rack - 28 Box', 0, NULL,
          (select ContainerDimensionID from biobank_container_dimension where X=6 and Y=4 and Z=1)),
        ('MatrixCo.', '##1', 'Matrix Box - 10x10', 0, NULL, 
          (select ContainerDimensionID from biobank_container_dimension where X=10 and Y=10 and Z=1)),
        ('Vacutainer', '366430', 'Red Top Tube (RTT)', 1,	
          (select ContainerCapacityID from biobank_container_capacity where Quantity=10 
          and UnitID=(select UnitID from biobank_unit where Label='mL')), 
          NULL),
        ('Vacutainer', '366480', 'Green Top Tube (GTT)', 1,
          (select ContainerCapacityID from biobank_container_capacity where Quantity=10 
          and UnitID=(select UnitID from biobank_unit where Label='mL')), 
          NULL),
        ('Vacutainer', '366643', 'Purple Top Tube (PTT)', 1,
          (select ContainerCapacityID from biobank_container_capacity where Quantity=10 
          and UnitID=(select UnitID from biobank_unit where Label='mL')), 
          NULL),
        ('Vacutainer', '###', 'Cryotube Vial', 1,
          (select ContainerCapacityID from biobank_container_capacity where Quantity=1000 
          and UnitID=(select UnitID from biobank_unit where Label='µL')), 
          NULL)
;

/*Specimen*/
INSERT INTO biobank_specimen_type (Label, FreezeThaw)
VALUES 	('Blood', 0),
        ('Urine', 0),
        ('Saliva', 0),
        ('Serum', 1),
        ('Plasma', 1),
        ('DNA', 1),
        ('PBMC', 0),
        ('CSF', 1),
        ('Muscle Biopsy', 0),
        ('Skin Biopsy', 0),
        ('Buccal Swab', 0)
;

INSERT INTO biobank_specimen_type_parent (SpecimenTypeID, ParentSpecimenTypeID)
VALUES ((select SpecimenTypeID from biobank_specimen_type where Label='Serum'),
         (select SpecimenTypeID from biobank_specimen_type where Label='Blood')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='Plasma'),
         (select SpecimenTypeID from biobank_specimen_type where Label='Blood')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='DNA'),
         (select SpecimenTypeID from biobank_specimen_type where Label='Blood')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='DNA'),
         (select SpecimenTypeID from biobank_specimen_type where Label='Buccal Swab')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='PBMC'),
         (select SpecimenTypeID from biobank_specimen_type where Label='Blood'))
;

INSERT INTO biobank_specimen_protocol (Label, SpecimenProcessID, SpecimenTypeID)
VALUES ('Blood Collection',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Collection'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='Blood')
       ),
       ('Saliva Collection',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Collection'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='Saliva')
       ),
       ('DNA Collection From Blood',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Collection'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='DNA')
       ),
       ('DNA Collection From Saliva',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Collection'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='DNA')
       ),
       ('CSF Collection',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Collection'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='CSF')
       ),
       ('PBMC Collection',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Collection'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='PBMC')
       ),
       ('Serum Collection',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Collection'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='Serum')
       ),
       ('PBMC Processing',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Preparation'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='Blood')
       ),
       ('Serum Processing',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Preparation'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='Blood')
       ),
       ('DNA Processing',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Preparation'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='Blood')
       ),
       ('CSF Processing',
        (SELECT SpecimenProcessID FROM biobank_specimen_process WHERE Label='Preparation'),
        (SELECT SpecimenTypeID FROM biobank_specimen_type WHERE Label='CSF')
       )
;

INSERT INTO biobank_specimen_attribute (Label, DatatypeID, ReferenceTableID)
VALUES 	('Clotted', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='boolean'), NULL), 
        ('Tube Expired', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='boolean'), NULL), 
        ('Centrifuge Start #1', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='time'), NULL), 
        ('Centrifuge End #1', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='time'), NULL), 
        ('Centrifuge Start #2', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='time'), NULL), 
        ('Centrifuge End #2', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='time'), NULL), 
        ('Centrifuge Start #3', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='time'), NULL), 
        ('Centrifuge End #3', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='time'), NULL), 
        ('Centrifuge Start #4', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='time'), NULL), 
        ('Centrifuge End #4', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='time'), NULL), 
        ('Red Pellet', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='boolean'), NULL), 
        ('Total PBMC Count (10⁶ cells)', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='number'), NULL), 
        ('Milky Serum', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='boolean'), NULL), 
        ('Hemolyzed', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='boolean'), NULL), 
        ('Hemodialysis Index', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='number'), NULL),
        ('No Visible Pellet', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='boolean'), NULL),
        ('DNA Concentration (ng/µL)', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='number'), NULL),
        ('260/280 Ratio', (SELECT DatatypeID FROM biobank_specimen_attribute_datatype WHERE Datatype='number'), NULL)
;

INSERT INTO biobank_specimen_protocol_attribute_rel (SpecimenProtocolID, SpecimenAttributeID, Required)
VALUES 	((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Processing'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Clotted'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Tube Expired'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge Start #1'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge End #1'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge Start #2'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge End #2'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge Start #3'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge End #3'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='Serum Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Tube Expired'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='Serum Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge Start #1'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='Serum Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge End #1'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Tube Expired'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge Start #1'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge End #1'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge Start #2'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge End #2'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge Start #3'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge End #3'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge Start #4'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Processing'), 
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Centrifuge End #4'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Collection'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Clotted'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Collection'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Red Pellet'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='PBMC Collection'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Total PBMC Count (10⁶ cells)'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='Serum Collection'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Milky Serum'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='Serum Collection'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Hemolyzed'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='Serum Collection'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Hemodialysis Index'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Collection From Blood'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='Red Pellet'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Collection From Blood'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='No Visible Pellet'), 0),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Collection From Blood'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='DNA Concentration (ng/µL)'), 1),
        ((select SpecimenProtocolID from biobank_specimen_protocol where Label='DNA Collection From Blood'),
           (select SpecimenAttributeID from biobank_specimen_attribute where Label='260/280 Ratio'), 1)
;

INSERT INTO biobank_specimen_type_unit_rel (SpecimenTypeID, UnitID)
VALUES ((select SpecimenTypeID from biobank_specimen_type where Label='Blood'), 
         (select UnitID from biobank_unit where Label='mL')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='Urine'), 
         (select UnitID from biobank_unit where Label='mL')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='Serum'), 
         (select UnitID from biobank_unit where Label='µL')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='Plasma'), 
         (select UnitID from biobank_unit where Label='µL')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='DNA'), 
         (select UnitID from biobank_unit where Label='µL')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='PBMC'), 
         (select UnitID from biobank_unit where Label='10⁶/mL')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='CSF'),
         (select UnitID from biobank_unit where Label='µL'))
;

INSERT INTO biobank_specimen_type_container_type_rel (SpecimenTypeID, ContainerTypeID)
VALUES ((select SpecimenTypeID from biobank_specimen_type where Label='Blood'),
        (select ContainerTypeID from biobank_container_type where label='Green Top Tube (GTT)')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='Blood'),
        (select ContainerTypeID from biobank_container_type where label='Red Top Tube (RTT)')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='Blood'),
        (select ContainerTypeID from biobank_container_type where label='Purple Top Tube (PTT)')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='Serum'),
        (select ContainerTypeID from biobank_container_type where label='Cryotube Vial')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='Plasma'),
        (select ContainerTypeID from biobank_container_type where label='Cryotube Vial')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='DNA'),
        (select ContainerTypeID from biobank_container_type where label='Cryotube Vial')),
       ((select SpecimenTypeID from biobank_specimen_type where Label='PBMC'),
        (select ContainerTypeID from biobank_container_type where label='Cryotube Vial'))
;
