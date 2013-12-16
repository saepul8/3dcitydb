-- BUILDING.sql
--
-- Authors:     Prof. Dr. Thomas H. Kolbe <thomas.kolbe@tum.de>
--              Zhihang Yao <zhihang.yao@tum.de>
--              Claus Nagel <cnagel@virtualcitysystems.de>
--              Philipp Willkomm <pwillkomm@moss.de>
--              Gerhard K�nig <gerhard.koenig@tu-berlin.de>
--              Alexandra Lorenz <di.alex.lorenz@googlemail.com>
--
-- Copyright:   (c) 2012-2014  Chair of Geoinformatics,
--                             Technische Universit�t M�nchen, Germany
--                             http://www.gis.bv.tum.de
--
--              (c) 2007-2012  Institute for Geodesy and Geoinformation Science,
--                             Technische Universit�t Berlin, Germany
--                             http://www.igg.tu-berlin.de
--
--              This skript is free software under the LGPL Version 2.1.
--              See the GNU Lesser General Public License at
--              http://www.gnu.org/copyleft/lgpl.html
--              for more details.
-------------------------------------------------------------------------------
-- About:
--
--
-------------------------------------------------------------------------------
--
-- ChangeLog:
--
-- Version | Date       | Description                               | Author
-- 3.0.0     2013-12-06   new version for 3DCityDB V3                 ZYao
--                                                                    TKol
--                                                                    CNag
--                                                                    PWil
-- 2.0.0     2007-11-23   release version                             TKol
--                                                                    GKoe
--                                                                    CNag
--                                                                    ALor
--
CREATE TABLE BUILDING
(
ID NUMBER NOT NULL,
BUILDING_PARENT_ID NUMBER,
BUILDING_ROOT_ID NUMBER,
CLASS VARCHAR2(256),
CLASS_CODESPACE VARCHAR2(4000),
FUNCTION VARCHAR2(1000),
FUNCTION_CODESPACE VARCHAR2(4000),
USAGE VARCHAR2(1000),
USAGE_CODESPACE VARCHAR2(4000),
YEAR_OF_CONSTRUCTION DATE,
YEAR_OF_DEMOLITION DATE,
ROOF_TYPE VARCHAR2(256),
ROOF_TYPE_CODESPACE VARCHAR2(4000),
MEASURED_HEIGHT NUMBER,
MEASURED_HEIGHT_UNIT VARCHAR2(4000),
STOREYS_ABOVE_GROUND NUMBER(8),
STOREYS_BELOW_GROUND NUMBER(8),
STOREY_HEIGHTS_ABOVE_GROUND VARCHAR2(4000),
STOREY_HEIGHTS_BELOW_GROUND VARCHAR2(4000),
LOD1_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY,
LOD2_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY,
LOD3_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY,
LOD4_TERRAIN_INTERSECTION MDSYS.SDO_GEOMETRY,
LOD2_MULTI_CURVE MDSYS.SDO_GEOMETRY,
LOD3_MULTI_CURVE MDSYS.SDO_GEOMETRY,
LOD4_MULTI_CURVE MDSYS.SDO_GEOMETRY,
LOD0_FOOTPRINT_ID NUMBER,
LOD0_ROOFPRINT_ID NUMBER,
LOD1_MULTI_SURFACE_ID NUMBER,
LOD2_MULTI_SURFACE_ID NUMBER,
LOD3_MULTI_SURFACE_ID NUMBER,
LOD4_MULTI_SURFACE_ID NUMBER,
LOD1_SOLID_ID NUMBER,
LOD2_SOLID_ID NUMBER,
LOD3_SOLID_ID NUMBER,
LOD4_SOLID_ID NUMBER 
)
;
ALTER TABLE BUILDING
ADD CONSTRAINT BUILDING_PK PRIMARY KEY
(
ID
)
 ENABLE
;