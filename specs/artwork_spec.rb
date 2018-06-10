require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../models/artist")
require_relative("../models/artwork")

class ArtworkTest < MiniTest::Test

  def setup()
    Artist.delete_all()
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

        @artist1.save()
        @artist2.save()
        Artwork.delete_all()
        @artwork1 = Artwork.new({
          "title" => "The Dessert Harmony In Red",
          "materials" => "Oil on Canvas",
          "category" => "Fauvism",
          "creation_year" => 1908,
          "image" => "public/the_dessert_harmony_in_red.jpg",
          "artist_id" => @artist1.id
          })
          @artwork1.save()

          @artwork2 = Artwork.new({
            "title" => "Reflection (Self-Portrait)",
            "materials" => "Oil on Canvas",
            "category" => "Expressionism",
            "creation_year" => 1985,
            "image" => "public/Reflection_self_portrait.jpg",
            "artist_id" => @artist2.id
            })
            @artwork2.save()

          end

          def test_title()
            result = @artwork1.title()
            assert_equal("The Dessert Harmony In Red", result)
          end

          def test_materials()
            result = @artwork1.materials()
            assert_equal("Oil on Canvas", result )
          end

          def test_category()
            result = @artwork2.category()
            assert_equal("Expressionism", result)
          end

          def test_creation_year()
            result = @artwork2.creation_year()
            assert_equal(1985, result)
          end

          def test_image()
            result = @artwork2.image()
            assert_equal("public/Reflection_self_portrait.jpg", result)
          end

          def test_artist_id()
            result = @artwork1.artist_id()
            assert_equal(@artist1.id, result)
          end


          def test_save_artwork()
            sql = "SELECT * FROM artworks WHERE id = $1"
            values = [@artwork1.id()]
            results = SqlRunner.run(sql, values)
            assert_equal("Fauvism", results.first()["category"])
          end

          def test_find_artwork()
            sql = "SELECT * FROM artworks WHERE id = $1"
            values = [@artwork1.id()]
            artwork = SqlRunner.run(sql, values)
            result = Artwork.new(artwork.first)
            assert_equal(1908, result.creation_year)
          end

          def test_show_all_artworks()
            sql = "SELECT * FROM artworks;"
            results = SqlRunner.run(sql)
            artwork_data = results.map {|result| Artwork.new(result)}
            assert_equal(2, artwork_data.count())
          end

          def test_update_artwork()
            @artwork2.title = "The Snail"
            @artwork2.update()
            assert_equal("The Snail", @artwork2.title())
          end

          def test_delete_artwork()
            @artwork1.delete()
            sql = "SELECT * FROM artworks"
            results = SqlRunner.run(sql)
            artwork_data = results.map{|result| Artwork.new(result)}
            assert_equal("Expressionism", artwork_data.first.category)
          end

          def test_delete_all_artworks()
            Artwork.delete_all()
            sql = "SELECT * FROM artworks"
            results = SqlRunner.run(sql)
            artwork_data = results.map{|result| Artwork.new(result)}
            assert_equal([], artwork_data)
          end


        end
