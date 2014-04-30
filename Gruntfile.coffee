
module.exports = (grunt) ->
  require('load-grunt-tasks') grunt

  grunt.initConfig
    watch:
      options:
        livereload: false
      src:
        files: ['src/**/*.coffee']
        tasks: ['src']

    coffee:
      src:
        expand: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'lib'
        ext: '.js'

    clean:
      src: ['lib']

    coffeelint:
      options:
        max_line_length:
          value: 130
      src:
        'src/**/*.coffee'

    release:
      options:
        npm: false

  grunt.registerTask('src', ['coffeelint:src', 'clean:src', 'coffee:src'])
