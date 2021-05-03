CREATE EXTENSION postgis;

CREATE TABLE locations (locationid int NOT NULL PRIMARY KEY,locationname text NOT NULL,geo geometry NOT NULL);

INSERT INTO locations VALUES (1,'Home','POINT(-118.288383 34.030597)'),
 (2,'Literatea', 'POINT(-118.283318 34.020278)'),
 (3,'Lemonade', 'POINT(-118.286176 34.020766)'),
 (4,'LittleGalen', 'POINT(-118.287060 34.023144)'),
 (5,'Fertitta', 'POINT(-118.282495 34.018969)'),
 (6,'Leavey Lib','POINT(-118.282701 34.021942)'),
 (7,'Dohney Lib', 'POINT(-118.283708 34.020289)'),
 (8,'Hoose Lib', 'POINT(-118.286595 34.018861)'),
 (9,'VKC Lib', 'POINT(-118.284022 34.021449)'),
 (10,'SGM', 'POINT(-118.289008 34.021643)'),
 (11,'SAL', 'POINT(-118.289474 34.019707)'),
 (12,'SSC', 'POINT(-118.289403 34.020101)'),
 (13,'THH', 'POINT(-118.284626 34.022409)');

SELECT locationname, ST_AsText(geo) FROM locations;

--- Query to calculate Convex Hull

SELECT ST_AsText(ST_ConvexHull(ST_Collect(geo))) FROM locations;

--- Query to calculate 4 nearest neighbours

SELECT locationname, ST_Astext(geo) as location, ST_Distance(geo,'POINT(-118.288383 34.03059)') as distance 
FROM locations
WHERE locationname<>'Home' 
ORDER BY ST_Distance(geo,'POINT(-118.288383 34.03059)') 
limit 4;

