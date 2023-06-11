defmodule Friouardle.Wordle_test do
  use Friouardle.DataCase
  alias Friouardle.Wordle

  describe "Words CRUD test" do
    test "create_word/1 create word entry correctly" do
      attribute = %{
        word: "apple",
        word_length: 5,
        word_letters: ["a", "p", "p", "l", "e"],
        type: "english"
      }

      {:ok, entry} = Wordle.create_word(attribute)
      assert entry.word == attribute.word
      assert entry.type == attribute.type
    end

    test "create_word/1 wrong entry" do
      attribute = %{
        words: "apple",
        word_length: 5,
        word_letters: ["a", "p", "p", "l", "e"],
        type: "english"
      }

      assert {:error, _} = Wordle.create_word(attribute)
    end

    test "get_word/1, fetch dectionary correctly" do
      word = insert!(:words)

      entry = Wordle.get_word(word.id)

      assert entry.id == word.id
    end

    test "get_word/1, no record to fetch" do
      assert nil == Wordle.get_word(21)
    end

    test "delete_word/1, delete word correctly" do
      word = insert!(:words)

      {:ok, deleted_entry} = Wordle.delete_word(word)

      assert deleted_entry.id == word.id
    end

    test "get_random_world/2, get  word with type and size" do
      word = insert!(:words)

      naruto_manga =
        insert!(:words,
          type: "manga",
          word: "naruto",
          word_letters: ["n", "a", "r", "u", "t", "o"],
          word_length: 6
        )

      _oshinoko_manga =
        insert!(:words,
          type: "manga",
          word: "oshinoko",
          word_letters: ["o", "s", "h", "i", "n", "o", "k", "o"],
          word_length: 8
        )

      assert word.word == Wordle.get_random_word()
      assert nil == Wordle.get_random_word("arabic")
      assert naruto_manga.word == Wordle.get_random_word("manga", 6)
    end
  end

  describe "main functions test" do
    test "guess/2" do
      correct_word = ["a", "p", "p", "l", "e"]
      guess_word = ["a", "m", "i", "n", "e"]
      guess_word_2 = ["p", "l", "e", "a", "d"]

      assert [{"a", :green}, {"m", :red}, {"i", :red}, {"n", :red}, {"e", :green}] ==
               Wordle.guess(guess_word, correct_word)

      assert [{"a", :green}, {"p", :green}, {"p", :green}, {"l", :green}, {"e", :green}] ==
               Wordle.guess(correct_word, correct_word)

      assert [{"p", :yellow}, {"l", :yellow}, {"e", :yellow}, {"a", :yellow}, {"d", :red}] ==
               Wordle.guess(guess_word_2, correct_word)
    end
  end
end
