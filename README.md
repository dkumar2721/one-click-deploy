# one-click-deploy
DevOps assignment: One-click REST API on AWS


+-------------------+
|      Client       |
| (Browser / curl)  |
+--------+----------+
         |
         | HTTP/HTTPS (Port 80/443)
         v
+--------+----------+
| Application Load  |
|    Balancer       |  ← Public Subnets (us-east-1a, us-east-1b)
| (Public, Internet-|
|  facing, DNS:     |
|  api-alb-*.elb...)|
+--------+----------+
         |
         | Forwards to Target Group (Port 8080)
         v
+--------+----------+
|  Target Group     |
| - Health Check:   |
|   → /health       |
| - Protocol: HTTP  |
+--------+----------+
         |
         | Routes to healthy EC2 instances
         v
+--------+----------+     +---------------------+
| Auto Scaling      |<--->| 2 x EC2 Instances   |
| Group (ASG)       |     | - No Public IP      |
| - Min/Max: 2      |     | - In Private        |
| - Private Subnets |     |   Subnets           |
+-------------------+     | - Runs Flask App on |
                          |   Port 8080         |
                          | - Installed via     |
                          |   User Data         |
                          +----------+----------+
                                     |
                                     | Egress only (updates, logs)
                                     v
                           +---------+----------+
                           |   NAT Gateway      | ← In Public Subnet
                           +---------+----------+
                                     |
                                     v
                           +---------+----------+
                           |  Internet Gateway  |
                           | (for outbound)     |
                           +--------------------+






