var cars = [
  {
    brand: 'honda',
    model: 'civic',
    properties: {
      color: "green",
      clean: false
    }
  },
  {
    brand: 'toyota',
    model: 'prius',
    properties: {
      color: "silver",
      clean: true
    }
  },
  {
    brand: 'ford',
    model: 'mustang',
    properties: {
      color: "blue",
      clean: false
    }
  },
  {
    brand: 'chevy',
    model: 'camaro',
    properties: {
      color: "red",
      clean: false
    }
  },
]

function cleanCars(cars) {
  for (let i = 0; i < cars.length; i++) {
    cars[i].properties.clean = true
  }
}
cleanCars(cars)
console.log(cars)

function paintCarsWithColor(orignalColor, newColor) {
  for (let i = 0, i < cars.length; i++) {
    if(cars[i].properties.color === originalColor) {
      cars[i].properties.color = newColor
    }
  }
}

paintCarsWithColor('green', 'blue')
paintCarsWithColor('blue', 'purple')
/*
[
  {
    brand: 'honda',
    model: 'civic',
    properties: {
      color: "blue",
      clean: true
    }
  },
  {
    brand: 'toyota',
    model: 'prius',
    properties: {
      color: "silver",
      clean: true
    }
  },
  {
    brand: 'ford',
    model: 'mustang',
    properties: {
      color: "blue",
      clean: true
    }
  },
  {
    brand: 'chevy',
    model: 'camaro',
    properties: {
      color: "red",
      clean: true
    }
  },
]
*/
 
