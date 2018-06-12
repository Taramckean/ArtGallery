require_relative('../models/artist')
require_relative('../models/artwork')
require('pry')

Artist.delete_all()
Artwork.delete_all()

@artist1 =Artist.new({
  "name" => "Henri Matisse",
  "birth_year" => 1869,
  "art_movement" => "Fauvism"
  })

  @artist2 = Artist.new({
    "name" => "Lucian Freud",
    "birth_year" => 1922,
    "art_movement" => "Realism"
    })

    @artist3 = Artist.new({
      "name" => "Alberto Giacometti",
      "birth_year" => 1901,
      "art_movement" => "Expressionism"
      })

      @artist1.save()
      @artist2.save()
      @artist3.save()

      @artwork1 = Artwork.new({
        "title" => "The Dessert Harmony In Red",
        "materials" => "Oil on Canvas",
        "category" => "Fauvism",
        "creation_year" => 1908,
        "image" => "/the-dessert-harmony-in-red.jpg",
        "artist_id" => @artist1.id
        })
        @artwork1.save()

        @artwork2 = Artwork.new({
          "title" => "Reflection (Self-Portrait)",
          "materials" => "Oil on Canvas",
          "category" => "Realism",
          "creation_year" => 1985,
          "image" => "/Reflection_self_portrait.jpg",
          "artist_id" => @artist2.id
          })
          @artwork2.save()

          @artwork3 = Artwork.new({
            "title" => "Seated Man",
            "materials" => "Oil on Canvas",
            "category" => "Expressionism",
            "creation_year" => 1959,
            "image" => "/giacometti_seated_man.jpg",
            "artist_id" => @artist3.id
            })
            @artwork3.save()

            @artwork4 = Artwork.new({
              "title" => "Portrait of John Deakin",
              "materials" => "Oil on Canvas",
              "category" => "Realism",
              "creation_year" => 1963,
              "image" => "/Lucian-Freud_Portrait-of-John-Deakin-1963-1964.jpg",
              "artist_id" => @artist2.id
              })
              @artwork4.save()

              @artwork5 = Artwork.new({
                "title" => "Sorrow of the King",
                "materials" => "Collage",
                "category" => "Fauvism",
                "creation_year" => 1952,
                "image" => "/Tristess-du-Roi-Sorrow-of-the-King-1952.jpg",
                "artist_id" => @artist1.id
                })
                @artwork5.save()

                @artwork6 = Artwork.new({
                  "title" => "Diego",
                  "materials" => "Oil on Canvas",
                  "category" => "Expressionism",
                  "creation_year" => 1959,
                  "image" => "/giacometti-04.jpg",
                  "artist_id" => @artist3.id
                  })
                  @artwork6.save()

                  @artwork7 = Artwork.new({
                    "title" => "The Painter's Mother III",
                    "materials" => "Oil on Canvas",
                    "category" => "Realism",
                    "creation_year" => 1972,
                    "image" => "/portrait_of_a_woman.jpg",
                    "artist_id" => @artist2.id
                    })
                    @artwork7.save()

                    @artwork8 = Artwork.new({
                      "title" => "The Joy of Life",
                      "materials" => "Oil on Canvas",
                      "category" => "Fauvism",
                      "creation_year" => 1905,
                      "image" => "/Joy_of_Life_1905.jpg",
                      "artist_id" => @artist1.id
                      })
                      @artwork8.save()

                      @artwork9 = Artwork.new({
                        "title" => "Portrait Of David Thompson",
                        "materials" => "Oil on Canvas",
                        "category" => "Expressionism",
                        "creation_year" => 1957,
                        "image" => "/giacometti-01.jpg",
                        "artist_id" => @artist3.id
                        })
                        @artwork9.save()

            artworks = Artwork.all()
            artists = Artist.all()

            binding.pry
            nil
