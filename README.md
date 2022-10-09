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
