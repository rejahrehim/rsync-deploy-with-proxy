# rsync-deploy-with-proxy

Deploy to a remote server using rsync through a Jump Host.

example usage to sync everything in the workspace folder:

```
- name: deploy to server
        uses: rejahrehim/rsync-deploy-with-proxy@v2.1.6
        env:
          DEPLOY_KEY: ${{ secrets.SERVER_SSH_KEY }}
          ARGS: "-e -c -r --delete"
          SERVER_PORT: ${{ secrets.SERVER_PORT }}
          FOLDER: "./"
          SERVER_IP: ${{ secrets.SERVER_IP }}
          USERNAME: ${{ secrets.USERNAME }}
          SERVER_DESTINATION: ${{ secrets.SERVER_DESTINATION }}
          PROXY_SERVER_PORT: ${{ secrets.PROXY_SERVER_PORT }}
          PROXY_SERVER_USERNAME: ${{ secrets.PROXY_SERVER_USERNAME }}
          PROXY_SERVER_IP: ${{ secrets.PROXY_SERVER_IP }}
```

If you only want to sync a specific subfolder you can put that folder in the folder env var instead
