To use the files in this routing directory:

1. Start an instance of Shapes with the default QOS (non-Secure) configuration files.  Have it join domain 0 and publish Squares, Circles, and Triangles all of the same color (i.e. Blue).  Subscribe to all 3 topics, too.

2. Start an instance of Shapes from the apps/TriWriter directory and use the QOS file from within the directory in Shapes (see videos above for a walk-through).  Have it join domain 2 and publish Squares, Circles, and Triangles of a different color than step 1, but all the same in this domain (i.e. all Red).  Subscribe to all 3 topics.

3. You should see the Squares from Shapes in domain 0 (non-Secure) showing up in domain 6 Shapes (Secured).

4. You should see the Circles from Shaspes in domain 6 (Secure) showing up in domain 0 Shapes (non-Secured).

5. Triangles are not forward from one to the other, the routing service does not attempt to forward this topic, but it also does not have permissions (see routing_permissions.xml)

6. Go to the apps/routing folder and start Routing Service with "rtiroutingservice -cfgFile USER_QOS_PROFILES.xml -cfgName example"

7. You can observe the routes in action in Admin Console

8. Disable the Square and Circle routes and enable the SquareFilter and CircleFilter routes to only forward Square/Circles when they are on the left side of the Shapes demo. 