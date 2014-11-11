module.exports = function(grunt) {

  // Configuration goes here
  grunt.initConfig({
    coffeelint: {
      app: ['src/*.coffee'],
      options: {
        configFile: './coffeelint.json'
      }
    },
    coffee: {
      compile: {
        files: {
          './js/index.js': 'src/index.coffee',
        }
      }
    },
    watch: {
      coffee: {
        files: ['src/*.coffee'],
        tasks: ['coffeelint', 'coffee']
      }
    }
  });

  // Load plugins here
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-coffeelint');

  // Define your tasks here
  grunt.registerTask('default', ['coffeelint', 'coffee', 'watch']);
};
