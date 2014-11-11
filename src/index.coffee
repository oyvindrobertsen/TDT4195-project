###
function MainScene(data) {
this.data = data;

this.scene = new THREE.Scene();

this.camera = new THREE.PerspectiveCamera(
75,
window.innerWidth/window.innerHeight,
0.1,
10000
  )
  this.camera.position.z = 100;
  this.camera.position.x = 100;

  this.geometry = new THREE.PlaneGeometry(100, 100);
  this.material = new THREE.MeshBasicMaterial({color: 0xff0000, side: THREE.DoubleSide});

  this.mesh = new THREE.Mesh(this.geometry, this.material);
  this.mesh.position = new THREE.Vector3(-10, 100, 10);
  this.scene.add(this.mesh);

  this.renderer = new THREE.WebGLRenderer({alpha: true});
  this.renderer.setSize(window.innerWidth, window.innerHeight);
  this.renderer.setClearColor(0xffffff, 1);

  document.body.appendChild(this.renderer.domElement);
}

MainScene.prototype.render = function() {
requestAnimationFrame(this.render.bind(this));

//this.mesh.rotation.x += 0.01;
//this.mesh.rotation.y += 0.02;

this.renderer.render(this.scene, this.camera);
};

// Do IP part here before the scene is constructed.
// Call MainScene constructor with list of objects from IP part.

var scene = new MainScene([]);
scene.render();
###

class MainScene
  constructor: (@data) ->
    @scene = new THREE.Scene()

    @camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth/window.innerHeight,
      0.1,
      10000
    )
    @camera.position.z = 1000
    
    @geometry = new THREE.BoxGeometry(200, 200, 200)
    @material = new THREE.MeshBasicMaterial(color: 0xff0000, wireframe: true)
    @mesh = new THREE.Mesh(@geometry, @material)
    @scene.add(@mesh)

    @renderer = new THREE.WebGLRenderer(alpha: true)
    @renderer.setSize(window.innerWidth, window.innerHeight)
    @renderer.setClearColor(0xffffff, 1)

    document.body.appendChild(@renderer.domElement)

  render: =>
    requestAnimationFrame(@render)
    
    @mesh.rotation.z += 0.01
    @mesh.rotation.y += 0.02

    @renderer.render(@scene, @camera)
    return

scene = new MainScene([])
scene.render()
