**Docker for Purpur Minecraft Server**

Example docker-compose.yml:

```
version: '3.8'

services:
 purpurmc:
   image: rootsquid/purpurmc-docker:1.3
   environment:
     - MEMORY=2G
     - EULA=false     #Eula true is required
     
   volumes:
     - /mcpurpur:/app/mcpurpur
   ports:
     - 25565:25565
   restart: unless-stopped
```
Use VERSIONPURPUR for specific versions
example:
- VERSIONPURPUR=1.19.2

Get a list of all versions from: 
https://api.purpurmc.org/v2/purpur
