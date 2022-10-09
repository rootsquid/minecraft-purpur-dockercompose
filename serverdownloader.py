import requests
import json
import os

if __name__ == "__main__":

    print("Running purpur python script")    

    

    url = "https://api.purpurmc.org/v2/purpur"

    resp = requests.get(url)
    
    jsonData = json.loads(resp.content)


    version = os.environ.get('VERSIONPURPUR')
    
    if  version:

        print("Looking for {} from {}".format(version, url))

        if version in jsonData['versions']:
            print("Version exists")
        else:
            print('Error: PurPur Version {} not found'.format(version))
            print("Make sure you have grabbed an available version from {} ".format(url))
            exit(0)
        
    else:
        
        #Grab the latest version if version environment isn't set
        latestVersion = jsonData['versions'][( len(jsonData['versions']) - 1) ]
        version = latestVersion
        
        
    downloadUrl = "https://api.purpurmc.org/v2/purpur/{}/latest/download".format(version)
    
    
    if not os.path.exists('./mcpurpur_{}.jar'.format(version)):

        #Download file
        with open('./mcpurpur_{}.jar'.format(version), 'wb') as f:
            print('Downloading server purpur version {} ...'.format(version))
            fileContent = requests.get(downloadUrl).content
            f.write(fileContent)
    
