# GoLang

## Installing GoLang
```bash
# Download
version="1.19.3"
filename="go${version}.linux-amd64.tar.gz"
wget ${filename}
tar xzvf ${filename}
sudo chown -R root:root ./go
sudo mv go /usr/bin/local

# .bash_profile
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
```

## Initializing A Project
```bash
# example{/module(m)/version(v2)}
go mod init example
go mod tidy
go run .
```

## Installaing a project
```bash
go install example
# which example
# $ /home/user/go/bin/example
```
