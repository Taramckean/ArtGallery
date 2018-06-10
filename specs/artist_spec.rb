require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../models/artist")

class ArtistTest < MiniTest::Test

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
      end

      def test_name()
        result = @artist1.name()
        assert_equal("Henri Matisse", result)
      end

      def test_birth_year()
        result = @artist1.birth_year()
        assert_equal(1869, result)
      end

      def test_art_movement()
        result = @artist1.art_movement()
        assert_equal("Fauvism", result)
      end

      def test_save_artist()
        sql = "SELECT * FROM artists WHERE id = $1"
        values = [@artist1.id()]
        results = SqlRunner.run(sql, values)
        assert_equal("Fauvism", results.first()["art_movement"])
      end

      # def test_show_all_artists()
      #   sql = "SELECT * FROM artists;"
      #   result = artists.map {|artist| Artist.new(artist)}
      #   return result
      #   assert_equal(result.art_movement, "Fauvism, Portrait Realism")
      # end

      def test_delete_artist()
        @artist1.delete()
        sql = "SELECT * FROM artists"
        results = SqlRunner.run(sql)
        artist_data = results.map{|result| Artist.new(result)}
        assert_equal("Portrait Realism", artist_data.first.art_movement)
      end

      def test_delete_all_artists()
        Artist.delete_all()
        sql = "SELECT * FROM artists"
        results = SqlRunner.run(sql)
        artist_data = results.map{|result| Artist.new(result)}
        assert_equal([], artist_data)
      end

    end
