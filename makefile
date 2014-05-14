site:
	./bin/build .site

server:
	ruby -run -e httpd .site -p 4000

publish:
	./bin/publish .site
