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
    "art_movement" => "Portrait Realism"
    })

    @artist3 = Artist.new({
      "name" => "Alberto Giacometti",
      "birth_year" => 1901,
      "art_movement" => "Surrealism"
      })

      @artist1.save()
      @artist2.save()
      @artist3.save()

      @artwork1 = Artwork.new({
        "title" => "The Dessert Harmony In Red",
        "materials" => "Oil on Canvas",
        "category" => "Fauvism",
        "creation_year" => 1908,
        "image" => "/the_dessert_harmony_in_red.jpg",
        "artist_id" => @artist1.id
        })
        @artwork1.save()

        @artwork2 = Artwork.new({
          "title" => "Reflection (Self-Portrait)",
          "materials" => "Oil on Canvas",
          "category" => "Expressionism",
          "creation_year" => 1985,
          "image" => "/Reflection_self_portrait.jpg",
          "artist_id" => @artist2.id
          })
          @artwork2.save()

          @artwork3 = Artwork.new({
            "title" => "Seated Man",
            "materials" => "Oil on Canvas",
            "category" => "Surrealism",
            "creation_year" => 1959,
            "image" => "/giacometti_seated_man.jpg",
            "artist_id" => @artist3.id
            })
            @artwork3.save()
            artworks = Artwork.all()
            artists = Artist.all()

            binding.pry
            nil
