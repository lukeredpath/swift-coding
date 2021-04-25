test: 
	swift test 2>&1 | xcbeautify

.PHONY: test
