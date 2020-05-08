*NOTE: this project taught me to use classes and their methods*

# Rules of the game

It is very simple - you have to guess the hidden word. You can enter only one letter per turn.

You can make a mistake no more than 7 times.

## Source of words for the game

The word for the game is randomly selected from the file:

```
/data/words.txt
```

Word requirements:
  1. Еvery word from a new line
  2. All letters in the word must be capitalized
  3. The game is tested in Russian and English

## Install and launch the game

`bundler` is using in the project. It must be installed. You can do this with the command:

```
gem install bundler
```

After that, install all the necessary gems:

```
bundle install
```

Now you can safely run the game:

```
bundle exec ruby main.rb
```

*The application requires Ruby version 2.4.0 or higher*
