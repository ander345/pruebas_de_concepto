# ########################################################################################
# # lab
# # ########################################################################################

network:
        docker network create -d bridge blknet

emqx:
        docker run -d --name emqx -p 1883:1883 -p 8883:8883 --net=blknet \
                -e EMQX_LOADED_PLUGINS="emqx_auth_pgsql" \
                -v ${HOME}/enviroscale/emqx.conf:/opt/emqx/etc/emqx.conf:ro \
                -v ${HOME}/enviroscale/emqx_auth_pgsql.conf:/opt/emqx/etc/plugins/emqx_auth_pgsql.conf:ro \
                -v ${HOME}/enviroscale/emqx_auth_mnesia.conf:/opt/emqx/etc/plugins/emqx_auth_mnesia.conf:ro \
                -v /etc/letsencrypt:/certs \
                emqx/emqx:5.0.8