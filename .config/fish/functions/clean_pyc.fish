function clean_pyc
    # Adapted from https://github.com/oh-my-fish/plugin-python/blob/master/functions/pyclean.fish
    find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete
end

