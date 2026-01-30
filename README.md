# docker tunn


# docker
```bash
export SSH_HOST=1.2.3.4
export SSH_USER=user1
export SSH_PASSWORD=secret
docker run -p 1080:1080 -e SSH_HOST -e SSH_USER -e SSH_PASSWORD ghcr.io/mrestivill/docker-tunn:main
