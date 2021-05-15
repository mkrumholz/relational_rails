# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plot.destroy_all
Garden.destroy_all
FlowerShop.destroy_all

north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                water_on: false,
                                water_access_pts: 2,
                                created_at: Time.parse('2021-02-01')
                              )
south_boulder = Garden.create!( name:"South Boulder Community Garden",
                                water_on: false,
                                water_access_pts: 3,
                                created_at: Time.parse('2021-04-01')
                              )
tuinpark = Garden.create!( name:"Tuinpark Ons Buiten",
                                water_on: true,
                                water_access_pts: 4,
                                created_at: Time.parse('2021-01-01')
                              )

north_boulder.plots.create!( name: "The Grove",
                          available: true,
                          sun_coverage: :full_shade,
                          square_ft: 250
                        )
north_boulder.plots.create!( name: "The Hive",
                          available: true,
                          sun_coverage: :partial_shade,
                          square_ft: 100
                        )
south_boulder.plots.create!( name: "Lothlorien",
                          available: false,
                          sun_coverage: :partial_sun,
                          square_ft: 120
                        )
tuinpark.plots.create!( name: "Keukenhof",
                          available: false,
                          sun_coverage: :full_sun,
                          square_ft: 400
                        )
tuinpark.plots.create!( name: "Kleine Tuinje",
                          available: true,
                          sun_coverage: :partial_shade,
                          square_ft: 88
                        )

mikes_flowers = FlowerShop.create!( name:"Mikes Flower Shop",
                                    rating: 3,
                                    same_day_delivery: false
                                  )
floral_designs = FlowerShop.create!( name:"Floral Designs",
                                    rating: 4,
                                    same_day_delivery: true
                              )
flower_depot = FlowerShop.create!( name:"Flower Depot",
                                    rating: 5,
                                    same_day_delivery: true
                              )

mikes_flowers.flowers.create!( species:"Rose",
                                    shelf_life: 5,
                                    in_stock: false
                                  )
mikes_flowers.flowers.create!( species:"Sunflower",
                                    shelf_life: 6,
                                    in_stock: true
                                  )
floral_designs.flowers.create!( species:"Tulip",
                                    shelf_life: 3,
                                    in_stock: true
                                  )
flower_depot.flowers.create!( species:"Carnation",
                                    shelf_life: 7,
                                    in_stock: true
                                  )
flower_depot.flowers.create!( species:"Rose",
                                    shelf_life: 5,
                                    in_stock: true
                                  )
