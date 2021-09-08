## Core Tools

Rubygems are packages of code that we can download and use in our programs or through command line.

### Ruby version Manager

Ruby version managers are programs that let you install, manage, and use multiple versions of Ruby.

We need to use some kind of ruby version manager, because we may need different versions of ruby for different projects and we need a system for switching between different ruby versions. Two reaons for having version manager:
1. Since Ruby is constantly evolving and improving, some of our code may work in one version and not work in another.
2. In working environments, we may need to work with a specific version of Ruby for the sake of standardizing the code.

### Bundler

Since different projects may require different versions of ruby and different versions of gems, having a sytematic way of dealing with the dependencies of the project is important. This is where Bundler comes in. Bundler is a dependency manager.

> Dealing with dependencies -- multiple versions of Ruby and multiple versions of Gems -- is a significant issue in Ruby. A project may need a Ruby version that differs from your default Ruby. Even if it requires the same version of Ruby, it may need a different version of a RubyGem.

> This problem is not unique to Ruby; dependency issues arise in all languages. The techniques used to deal with the dilemma differ with each language. In Ruby, most developers use a Ruby version manager such as RVM or rbenv to manage multiple Ruby versions. You can also use your version manager to manage Gem dependencies, but the favored approach is to use a dependency manager.

**Gemfile and Gemfile.lock**

Bundler relies on a file named `Gemfile` to tell it which version of Ruby and its Gems it should use. While working on a project, it is important to create a `Gemfile` and lists all our dependencies there.

`Gemfile` uses a Domain Specific Language (DSL) to provide details about the Ruby and Gem versions. This file works as a instruction manual for Bundler.

For example, the instruction inside of a `Gemfile` would look something like this: (From Launch School)

```
source 'https://rubygems.org'

ruby '2.3.1'
gem 'sinatra'
gem 'erubis'
gem 'rack'
gem 'rake', '~>10.4.0' # This specifies the version number
```

> After you create Gemfile, the `bundle install` command scans it, downloads and installs all the dependencies listed, and produces a Gemfile.lock file. Gemfile.lock shows all the dependencies for your program; this includes the Gems listed in Gemfile, as well as the Gems they depend on (the dependencies), which may not be explicitly listed in the Gemfile. It's very common for RubyGems you install for use in your project to rely on many other gems, creating a large dependency tree.

If you need to add some more gems, you would have to update the `Gemfile` accordingly and run the `bundle install` command to make sure the the `Gemfile.lock` is up to date.

A `Gemfile.lock` would look somethng like this:

```
GEM
  remote: https://RubyGems.org/
  specs:
    erubis (2.7.0)
    rack (1.6.4)
    rack-protection (1.5.3)
      rack
    rake (10.4.2)
    sinatra (1.4.7)
      rack (~> 1.5)
      rack-protection (~> 1.4)
      tilt (>= 1.3, < 3)
    tilt (2.0.5)

PLATFORMS
  ruby

DEPENDENCIES
  erubis
  rack
  rake (~> 10.4.0)
  sinatra

RUBY VERSION
   ruby 2.3.1p112

BUNDLED WITH
   1.13.6
```

### Rake

### Gemfiles

