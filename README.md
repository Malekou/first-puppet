# What does it do?

Configuration pour vagrant via puppet.

* Vagrantfile
* Apache 2.2
* PHP 5.2
* phpMyAdmin
* MySQL Server


<h2>Installation</h2>

<p>Créer un repertoire pour la nouvelle box.</p>

    $ mkdir sand-box
    $ cd sand-box

<p>Cloner le repo git</p>

    $ git clone git://github.com/Malekou/first-puppet.git


<h2>Initialiser la box</h2>

    $ vagrant up

<h2>Creating new puppet module</h2>

<p>To create a new module use this default template.</p>

    $ mkdir –p /puppet_folder/modules/MODULE_NAME/{files,templates,manifests}
    $ touch /puppet_folder/modules/MODULE_NAME/manifests/init.pp

