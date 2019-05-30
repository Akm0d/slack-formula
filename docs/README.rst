.. _readme:

slack-formula
================

A SaltStack formula for slack. It will install slack, ensure that workspaces are joined, and will force a
dark/light theme.

.. contents:: **Table of Contents**

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see :ref:`How to contribute <CONTRIBUTING>` for more details.

Available states
----------------

.. contents::
   :local:

``slack``
^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This installs the slack package,
manages the slack configuration file and then
starts the associated slack service.

``slack.package``
^^^^^^^^^^^^^^^^^^^^

This state will install the slack package only.

``slack.config``
^^^^^^^^^^^^^^^^^^^

This state will configure the slack service and has a dependency on ``slack.install``
via include list.

``slack.service``
^^^^^^^^^^^^^^^^^^^^

This state will start the slack service and has a dependency on ``slack.config``
via include list.

``slack.clean``
^^^^^^^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

this state will undo everything performed in the ``slack`` meta-state in reverse order, i.e.
stops the service,
removes the configuration file and
then uninstalls the package.

``slack.service.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^^

This state will stop the slack service and disable it at boot time.

``slack.config.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the configuration of the slack service and has a
dependency on ``slack.service.clean`` via include list.

``slack.package.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the slack package and has a dependency on
``slack.config.clean`` via include list.

``slack.package.latest``
^^^^^^^^^^^^^^^^^^^^^^^^^^

This keep the slack package up to date and has a dependency on
``slack.package.install`` via include list.

``slack.theme``
^^^^^^^^^^^^^^^^^^

This state will set the slack theme to light or dark and will trigger on a change in
``slack.package.install`` or ``slack.package.latest``


Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Chocolatey
* Apt

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``slack`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.

