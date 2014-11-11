var scene, camera, renderer, geometry, material, points_1, points_2,
    plight, pulsers;
var points_1 = [];
var points_2 = [];
var NUMBER_OF_CIRCLES = 55;
var origo = new THREE.Vector3(0, 0, 0);

var addSpinners = function() {
  geometry = new THREE.SphereGeometry(10, 32, 32);
  material = new THREE.MeshPhongMaterial({color: 0x000000});
  for (var i = 0; i < NUMBER_OF_CIRCLES; i++) {
    var point = new THREE.Mesh(geometry, material);
    point.position.x = 200 * Math.sin(i) - 100;
    point.position.y = 200 * Math.cos(i);
    points_1.push(point);
    scene.add(point);
    point = new THREE.Mesh(geometry, material);
    point.position.x = 200 * Math.sin(i) + 100;
    point.position.z = 200 * Math.cos(i);
    points_2.push(point);
    scene.add(point);
  }
};


var init = function() {
  scene = new THREE.Scene();
  camera = new THREE.PerspectiveCamera(75,
                                  window.innerWidth/window.innerHeight,
                                  0.1, 10000);
  scene.add(camera);
  renderer = new THREE.WebGLRenderer({alpha: true});
  renderer.setSize(window.innerWidth, window.innerHeight);
  renderer.setClearColor(0xffffff, 1);
  document.body.appendChild(renderer.domElement);
  plight = new THREE.PointLight(0xffffff, 10, 400);
  plight.position.set(100, 100, 100);
  camera.position.set(100, 100, 100);
  scene.add(plight);
  addSpinners();
  //addPulsers();
};

var updateCameraPos = function(t) {
  camera.position.x -= 5 * Math.sin(t/1000);
  camera.position.y -= 5 * Math.sin(t/1000);
  camera.position.z -= 5 * Math.cos(t/1000);
  plight.position.x -= 5 * Math.sin(t/1000);
  plight.position.y -= 5 * Math.sin(t/1000);
  plight.position.z -= 5 * Math.cos(t/1000);
  camera.lookAt(origo);
};

var render = function() {
  var t = Date.now();
  requestAnimationFrame(render);
  for (var i = 0; i < NUMBER_OF_CIRCLES; i++) {
    var point = points_1[i];
    point.position.x = 200 * Math.sin(t/1000 + i) - 100;
    point.position.y = 200 * Math.cos(t/1000 + i);
    point = points_2[i];
    point.position.x = 200 * Math.sin(t/1000 + i) + 100;
    point.position.z = 200 * Math.cos(t/1000 + i);
  }
  updateCameraPos(t);
  renderer.render(scene, camera);
};

init();
render();

