class MainScene
  constructor: (@object_data, @width, @height) ->
    @scene = new THREE.Scene()

    @camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth/window.innerHeight,
      0.1,
      10000
    )
    @camera.position.z = 0
    @camera.position.y = 1000
    @camera.position.x = 0
    @camera.lookAt(new THREE.Vector3(0, 0, 0))

    @plane = @addPlane()

    @objects = @addObjects()

    @renderer = new THREE.WebGLRenderer({alpha: true})
    @renderer.setSize(window.innerWidth, window.innerHeight)
    @renderer.setClearColor(0xffffff, 1)

    document.body.appendChild(@renderer.domElement)

  render: =>
    requestAnimationFrame(@render)

    @renderer.render(@scene, @camera)
    return

  addPlane: ->
    planeGeometry = new THREE.PlaneGeometry(@width, @height, 100)
    planeMaterial = new THREE.MeshBasicMaterial({color: 0x000000, wireframe: true})
    planeMesh = new THREE.Mesh(planeGeometry, planeMaterial)
    planeMesh.rotateOnAxis(new THREE.Vector3(1, 0, 0), 1.57)
    planeMesh.position.z += 500
    planeMesh.position.x += 500
    @scene.add(planeMesh)
    return planeMesh

  addObjects: ->
    objList = []
    for object in @object_data
      objGeometry = new THREE.RingGeometry(20, 100, 100)
      objMaterial = new THREE.MeshBasicMaterial({color: 0xff0000, side: THREE.DoubleSide, wireframe: true})
      objMesh = new THREE.Mesh(objGeometry, objMaterial)
      objMesh.position.z = 1000 - object.center.x
      objMesh.position.x = object.center.y
      objMesh.position.y = 1
      objMesh.rotateOnAxis(new THREE.Vector3(1, 0, 0), 1.57)
      objList.push(objMesh)
      @scene.add(objMesh)
    return objList


stuff = [
  {type: 'coin', center: {x: 200, y: 200}},
  {type: 'coin', center: {x: 400, y: 400}}
]

width = height = 1000

scene = new MainScene(stuff, width, height)
scene.render()
