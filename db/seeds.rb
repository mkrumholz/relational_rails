# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Garden.destroy_all

north_boulder = Garden.create!( name:"North Boulder Community Garden",
                                water_on: false,
                                water_access_pts: 2,
                                created_at: Time.now,
                                updated_at: Time.now
                              )
south_boulder = Garden.create!( name:"South Boulder Community Garden",
                                water_on: false,
                                water_access_pts: 3,
                                created_at: Time.now,
                                updated_at: Time.now
                              )
tuinpark = Garden.create!( name:"Tuinpark Ons Buiten",
                                water_on: true,
                                water_access_pts: 4,
                                created_at: Time.now,
                                updated_at: Time.now
                              )
