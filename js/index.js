function MainScene(data) {
  this.data = data;

  this.scene = new THREE.Scene();

  this.camera = new THREE.PerspectiveCamera(
    75,
    window.innerWidth/window.innerHeight,
    0.1,
    10000
  );
  this.camera.position.z = 1000;
  
  this.geometry = new THREE.BoxGeometry(200, 200, 200);
  this.material = new THREE.MeshBasicMaterial({color: 0xff0000, wireframe: true});

  this.mesh = new THREE.Mesh(this.geometry, this.material);
  this.scene.add(this.mesh);

  this.renderer = new THREE.WebGLRenderer();
  this.renderer.setSize(window.innerWidth, window.innerHeight);

  document.body.appendChild(this.renderer.domElement);
}

MainScene.prototype.render = function() {
  requestAnimationFrame(this.render.bind(this));
  
  this.mesh.rotation.x += 0.1;
  this.mesh.rotation.y += 0.2;

  this.renderer.render(this.scene, this.camera);
};

// Do IP part here before the scene is constructed.

var scene = new MainScene([]);
scene.render();
