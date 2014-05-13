server:
	ruby -run -e httpd . -p 4000

publish:
	git push origin master
	git checkout -f gh-pages
	git merge master
	git push origin gh-pages
	git checkout -f master
