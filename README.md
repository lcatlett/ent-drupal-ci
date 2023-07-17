# ent-drupal-ci

[![Github Actions](https://github.com/lcatlett/ent-drupal-ci/actions/workflows/build_deploy_and_test.yml/badge.svg)](https://github.com/lcatlett/ent-drupal-ci/actions/workflows/build_deploy_and_test.yml)
[![Dashboard ent-drupal-ci](https://img.shields.io/badge/dashboard-ent_drupal_ci-yellow.svg)](https://dashboard.pantheon.io/sites/f2a3dfaa-8ca9-483b-80f1-e2504030e55a#dev/code)
[![Dev Site ent-drupal-ci](https://img.shields.io/badge/site-ent_drupal_ci-blue.svg)](http://dev-ent-drupal-ci.pantheonsite.io/)

This is a demo site of Pantheon's Drupal 9 reference architecture.

It builds on Pantheon's default Drupal 9 upstream and Pantheon's default Build Tools to provide:

-  A reference architecture for Drupal 9 on Pantheon.
-  Best practices, default configuration, and accellerator tools for using Drupal 9 in enterprise archictures.
-  High performance, configurable CI / CD tuned to the needs of enterprise Drupal projects.

## Enterprise CI / CD?

A key part of a modern Drupal implementation is automation via CI / CD. Many Pantheon customers use Pantheon's Build Tools to accellerate a standard CI / CD implementation. However, enterprise Drupal projects often have more complex requireents beyond the features currently provided by Build Tools. 
  
As such, this project enhances Pantheon's standad Build Tools starterkit with:

- Enterprise Docker build container with advanced build caching capabilities
- High performance build caching
- Background job supprt in build
- Pantheon job monitoring
- Pantheon platform health checks integrated into build
- Capabilities for matrixed builds
