# vs 
OS := $(shell uname)
mkfile_dir := $(CURDIR)
.PHONY: b up ps restart kill
up:
	docker compose up --build -d
b:
	docker compose build
test:
	docker build -t k:test vs
	docker run -it --name kd --rm --entrypoint fish k:test
ps:
	docker compose ps
restart:
 	docker compose restart
# is this right? or rm or stop?
kill:
	docker compose kill 

# .PHONY: home
# home:
# 	mkdir -p "$$HOME/.config"
# 	rm -rf "$$HOME/.config/fish"
# 	ln -sfnv "$(CURDIR)/vs/config/fish" "$$HOME/.config/fish"
