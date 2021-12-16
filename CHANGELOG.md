# [2.2.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.1.0...v2.2.0) (2021-12-16)


### Bug Fixes

* sdk version bump ([bd57566](https://github.com/Yonomi/yonomi-device-widgets/commit/bd575664b70a4cea8c02f900fd9d8466135f0f6c))


### Features

* **detail_screen:** handle PowerTrait and render a Power widget ([650c487](https://github.com/Yonomi/yonomi-device-widgets/commit/650c4876da34c6ccfe0c96c26ebe226e7f217ca4))
* **power_trait_provider:** reflect error state in UI ([cd3d154](https://github.com/Yonomi/yonomi-device-widgets/commit/cd3d15473397081d2be73ba707a41eb70ffdbe62))
* **power_trait_provider.dart:** expose an error message along with error state ([e0a9260](https://github.com/Yonomi/yonomi-device-widgets/commit/e0a92606074ee89491a94aaf60d23b71deb14914))
* **power_trait_provider.dart:** introduce PowerTraitProvider ([d088a5c](https://github.com/Yonomi/yonomi-device-widgets/commit/d088a5cb7fd65b7a6d9327b7f96a3e2bc635b9d6))
* **trait_detail_screen:** use PowerProvider to view state and perform actions on device ([9a65169](https://github.com/Yonomi/yonomi-device-widgets/commit/9a65169b4354e2f9e04a0f01a5cbf62814e0b73b))
* **trait_device_screen:** show toast with error message if any error occurs ([0cebb62](https://github.com/Yonomi/yonomi-device-widgets/commit/0cebb62db54748f373ab0c9026b22dae4bd760ca))

# [2.1.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.0.1...v2.1.0) (2021-12-10)


### Bug Fixes

* **lock_item_icon.dart:** Use actual size and color arguments ([cceea78](https://github.com/Yonomi/yonomi-device-widgets/commit/cceea7880460d8c550dda985d9563e6e25c17cd0))
* **lock_item_icon.dart:** Use the correct bootstrap lock icons ([ebea44c](https://github.com/Yonomi/yonomi-device-widgets/commit/ebea44c36247c494081bb3442d740d79a725c9af))
* **lock_widget.dart:** Remove arc as the arc doesn't match mockups for lock ([fc5e019](https://github.com/Yonomi/yonomi-device-widgets/commit/fc5e01941573c47169ba0cefd64bcf1570db08ce))
* **thermostat_icon_test.dart:** Use text style when provided ([0742522](https://github.com/Yonomi/yonomi-device-widgets/commit/0742522a86b877bca9e26d22fdc0e5478a3ff790))
* **unknown_item_icon.dart:** Use constructor size and color instead of constant ([860634b](https://github.com/Yonomi/yonomi-device-widgets/commit/860634b61adc26c6ac60facd02a199342d8eadd5))
* ref pegged to commit ([4762ca4](https://github.com/Yonomi/yonomi-device-widgets/commit/4762ca41b9412118d24c6590b248e3220e49f3e3))
* **unknown_widget.dart,device_provider.dart,unknown_provider.dart:** Remove widget provider logic for unknown device ([003a674](https://github.com/Yonomi/yonomi-device-widgets/commit/003a67453ae1434d6c0c6d283e26e833fe0a80a7))
* alignments ([a1e5a6d](https://github.com/Yonomi/yonomi-device-widgets/commit/a1e5a6db3204c507efc00d39ebca8f6d7dc86959))
* cleanup ([28e4d03](https://github.com/Yonomi/yonomi-device-widgets/commit/28e4d03adbb3705327dcd5e8ef32ee67b5fe1e04))
* code cleanup ([67db7d0](https://github.com/Yonomi/yonomi-device-widgets/commit/67db7d048458df45d092edb218b94a0479d9538a))
* coverage plus cleanup ([0d933a2](https://github.com/Yonomi/yonomi-device-widgets/commit/0d933a2ebf84b88b837f379ff8f6e8b1379ca471))
* detail screen ([862835a](https://github.com/Yonomi/yonomi-device-widgets/commit/862835a1bf12efde16e0898c7154c2140a7b2d42))
* increase code coverage ([5ec43d6](https://github.com/Yonomi/yonomi-device-widgets/commit/5ec43d6627b0a6661611e0f10544c6e6a828dba4))
* lock widget display ([0633664](https://github.com/Yonomi/yonomi-device-widgets/commit/0633664acf365355d8f002d8de677dba7b0ff5b9))
* moved detail screen to device widget ([522bdef](https://github.com/Yonomi/yonomi-device-widgets/commit/522bdef646ccefc8fb778e633301b76327595c33))
* rename test ([c392d7c](https://github.com/Yonomi/yonomi-device-widgets/commit/c392d7c2e2f913f6f87d9c75bb0dba4218766210))
* sdk dependency ([5df8963](https://github.com/Yonomi/yonomi-device-widgets/commit/5df8963485bc4ec5283b2f87d101a06bd9f62b4a))
* simplified the logic to use bootstrap directly ([9ad42a4](https://github.com/Yonomi/yonomi-device-widgets/commit/9ad42a4028c4e3bd71f2ebbb4e9aab8af312169a))
* upgrade sdk ([ec31cc7](https://github.com/Yonomi/yonomi-device-widgets/commit/ec31cc70c46f475fa5973471bcb6cb261265eee7))


### Features

* **lib/assets/traits/device_item_icon.dart,lib/assets/traits/unknown_item_icon.dart,lib/components/unknown_widget.dart,test/assets/device_item_icon_test.dart:** Add display of Bootstrap Icons box for unknown trait devices ([24b5cad](https://github.com/Yonomi/yonomi-device-widgets/commit/24b5cad49bec87aba14d883cc77b1d4c649a966a))
* **trait_based:** create new trait-based device detail screen ([16f42ae](https://github.com/Yonomi/yonomi-device-widgets/commit/16f42aec97764f4b2c3aa8c6d4c01cd65c12ee80))
* **unknown_widget.dart,device_provider.dart,unknown_provider.dart:** Add a provider for the unknown trait devices and a base provider ([673bc69](https://github.com/Yonomi/yonomi-device-widgets/commit/673bc69996f6a17aca8f4c2b853be790ba168847))

## [2.0.1](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.0.0...v2.0.1) (2021-11-22)


### Bug Fixes

* upgrade version ([41b0300](https://github.com/Yonomi/yonomi-device-widgets/commit/41b0300044f517b8b898fe6b92181faadf024b81))

# [2.0.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v1.1.0...v2.0.0) (2021-11-19)


### Bug Fixes

* all tests passing ([6999c74](https://github.com/Yonomi/yonomi-device-widgets/commit/6999c743af1d9eebbd1451cc18004b9163285847))
* build test code ([e247044](https://github.com/Yonomi/yonomi-device-widgets/commit/e24704473fcbf04a401fa86fff587c621a0354c0))
* Fix build from any Null test error ([15edc76](https://github.com/Yonomi/yonomi-device-widgets/commit/15edc763397687bc03c789fbc3115ca88057418c))
* Fix lock_provider_test mock method signatures and tests ([8a4b30b](https://github.com/Yonomi/yonomi-device-widgets/commit/8a4b30bea659c235dd1f6f95a88e2b9b3fbfdab4))
* Fix lock_provider_test mock method signatures and tests ([897a7bb](https://github.com/Yonomi/yonomi-device-widgets/commit/897a7bbf60399c667197bf509680de906bf540b3))
* Fix mock lock provider get details function signature ([37a9b72](https://github.com/Yonomi/yonomi-device-widgets/commit/37a9b725c1ac18b3f5dafb357070934b80365968))
* flutter version ([199efaa](https://github.com/Yonomi/yonomi-device-widgets/commit/199efaa13dfb99efbe8cf275bacd1cc6b6b0db6c))
* injection method non nullable ([ba7aeff](https://github.com/Yonomi/yonomi-device-widgets/commit/ba7aeff12393a91e5dc5a32a55429c0b7f2e9376))
* merge fixes ([ce6b92f](https://github.com/Yonomi/yonomi-device-widgets/commit/ce6b92f318b8d56a531ed33a195645fc5dd506f2))
* mocking lockunlocak ([a691110](https://github.com/Yonomi/yonomi-device-widgets/commit/a691110745b0fdb2509696f9433e5d8af408e50c))
* modes_toolbar_test ([554b316](https://github.com/Yonomi/yonomi-device-widgets/commit/554b3162eb3e553d70aa0fb77fc62b0694a0de59))
* provider tests ([0f619f4](https://github.com/Yonomi/yonomi-device-widgets/commit/0f619f459529beb36ec8a70437d0cfd34df4926e))
* Remove bad implicit casts ([483a529](https://github.com/Yonomi/yonomi-device-widgets/commit/483a529fc918d97e34b1ce2a20a652541a3aea7e))
* updated sdk dependency ([beed178](https://github.com/Yonomi/yonomi-device-widgets/commit/beed1789d05dfd5f2841d186074d0a55d0058c62))


* Merge pull request #20 from Yonomi/fix_dependencies ([9261801](https://github.com/Yonomi/yonomi-device-widgets/commit/9261801d347d7587a1549d5af7cf14d179bed61c)), closes [#20](https://github.com/Yonomi/yonomi-device-widgets/issues/20)


### BREAKING CHANGES

* make codebase null-safe compatible

# [1.1.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v1.0.6...v1.1.0) (2021-06-02)


### Bug Fixes

* lock provider doesn't execute action if an action is pending ([9a0c4e5](https://github.com/Yonomi/yonomi-device-widgets/commit/9a0c4e50c501ae126988e6a71a0803c8be60962e))
* **build:** Fixing build errors happening due to newer flutter version ([6850172](https://github.com/Yonomi/yonomi-device-widgets/commit/6850172e51a288ebee64d12f6e33378cbc39cab4))
* **cicd:** Publish step added ([50e3f21](https://github.com/Yonomi/yonomi-device-widgets/commit/50e3f211b4690c7e606a79d05a8ac2efdaa0b728))
* **dependency:** Pointed to private repo ([f3c9308](https://github.com/Yonomi/yonomi-device-widgets/commit/f3c93083a989d916c3dc64b05c41ebf2cf045c56))
* **renaming_package:** fix renaming packages ([4e63fca](https://github.com/Yonomi/yonomi-device-widgets/commit/4e63fca06011c746da1ddb9a93be1112ac1f9082))
* **semver:** added simple pipeline setup ([aaa63ad](https://github.com/Yonomi/yonomi-device-widgets/commit/aaa63adf4183f0dd0f0dae3d29cc9edc417ac728))
* **semver:** clear naming circleci ([d375361](https://github.com/Yonomi/yonomi-device-widgets/commit/d375361cffe007cc4dc33fcf23b8b01dd85b709d))
* **semver:** global pub needs link ([758ee8b](https://github.com/Yonomi/yonomi-device-widgets/commit/758ee8b96bfb93b76521bb0bcb1bb368f61dd689))
* **semver:** Make sure all test reports are generated ([0ee1cc9](https://github.com/Yonomi/yonomi-device-widgets/commit/0ee1cc952453d9be1b1d53360881a21b18be3003))
* **semver:** tests broken because pub ([c99ddae](https://github.com/Yonomi/yonomi-device-widgets/commit/c99ddaedf15ee2fb95f3e69d70628f5aba8f40b5))
* use GestureDetector instead of InkWell widget for center icon ([6e1ce89](https://github.com/Yonomi/yonomi-device-widgets/commit/6e1ce89002c00a2df747bf6fa6a37448f54d6644))
* use renamed DeviceItemIcon methods ([63a55ce](https://github.com/Yonomi/yonomi-device-widgets/commit/63a55ceced90924e368305bd258923ae669189ec))
* **test:** Added test ([f46cd1a](https://github.com/Yonomi/yonomi-device-widgets/commit/f46cd1ac0855737113b7765eb10789871b2ef838))
* **version:** Downgrade mockito ([da3156e](https://github.com/Yonomi/yonomi-device-widgets/commit/da3156e24a18bdf55ad691c8e582fa01a80b668d))


### Features

* Arc component supports: displayOnly, SingleSelector, DoubleSelector modes ([fd1a722](https://github.com/Yonomi/yonomi-device-widgets/commit/fd1a7226bf695d74dbce991f24922def83710449))
* arc ring color matches lock state color specs ([a02e68b](https://github.com/Yonomi/yonomi-device-widgets/commit/a02e68b9a4c591a31ef96e468884be642f9da3e6))
* expose Loading state when either retrieving detail or performing action in Provider ([cd33d76](https://github.com/Yonomi/yonomi-device-widgets/commit/cd33d76ca7c2433dff95da23adc351e2e64ce516))
* initial creation of Lock widget and its components ([42e46cf](https://github.com/Yonomi/yonomi-device-widgets/commit/42e46cff4819874a5ef4fd50675ea60d34970da1))
* lockProvider uses LockRepository to send lock action ([8640b0f](https://github.com/Yonomi/yonomi-device-widgets/commit/8640b0f1527881ce20559b504756d827cca254c3))
* show center lock or unlock icon depending on state ([a7fdb76](https://github.com/Yonomi/yonomi-device-widgets/commit/a7fdb76629aba32d7f2e60c33367ef59c736fe3e))
* show circular progress indicator while LockProvider loads data ([e557e34](https://github.com/Yonomi/yonomi-device-widgets/commit/e557e3428cd64c0b557ee6b68949380f7c802ede))
* use Arc component for Lock Widget ([12dba33](https://github.com/Yonomi/yonomi-device-widgets/commit/12dba33074c4f59ebdc7b5f3c16eb0d288505b66))

## [1.0.6](https://github.com/Yonomi/yonomi-device-widgets/compare/v1.0.5...v1.0.6) (2021-05-18)


### Bug Fixes

* **package:** Changed name ([7d1f0a4](https://github.com/Yonomi/yonomi-device-widgets/commit/7d1f0a439a35ae2932a7948367341b8280b90348))
* **package:** Name changed ([9ad0f66](https://github.com/Yonomi/yonomi-device-widgets/commit/9ad0f66ab0a074b058091e97049f331a64e68c02))

## [1.0.5](https://github.com/Yonomi/yonomi-device-widgets/compare/v1.0.4...v1.0.5) (2021-05-18)


### Bug Fixes

* **cicd:** test steps cleanup ([ba370f6](https://github.com/Yonomi/yonomi-device-widgets/commit/ba370f60d3f763aed0c858ef2632d8f2e674c6cc))

## [1.0.4](https://github.com/Yonomi/yonomi-device-widgets/compare/v1.0.3...v1.0.4) (2021-05-18)


### Bug Fixes

* **cicd:** publish fixes ([ce137e4](https://github.com/Yonomi/yonomi-device-widgets/commit/ce137e40ec33d4fbccbe1739963185e73d4f97b8))

## [1.0.3](https://github.com/Yonomi/yonomi-device-widgets/compare/v1.0.2...v1.0.3) (2021-05-18)


### Bug Fixes

* **cicd:** Fix workspace ([c4e2b1b](https://github.com/Yonomi/yonomi-device-widgets/commit/c4e2b1ba150f476249219ccc35acd501eff48c0a))

## [1.0.2](https://github.com/Yonomi/yonomi-device-widgets/compare/v1.0.1...v1.0.2) (2021-05-18)


### Bug Fixes

* **cicd:** url fixed ([088399b](https://github.com/Yonomi/yonomi-device-widgets/commit/088399bc1a7cac662e4ead49e2abf6e0ecfaa1e4))

## [1.0.1](https://github.com/Yonomi/yonomi-device-widgets/compare/v1.0.0...v1.0.1) (2021-05-18)


### Bug Fixes

* **changelog:** changelog fixes ([795285f](https://github.com/Yonomi/yonomi-device-widgets/commit/795285fe6fd28381788e82b9259dc137a6a984b1))

# 1.0.0 (2021-05-18)
