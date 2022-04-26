# [2.10.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.9.0...v2.10.0) (2022-04-26)


### Features

* **ColorTemperature:** ColorTemperature dynamic widget (DX-362) ([#44](https://github.com/Yonomi/yonomi-device-widgets/issues/44)) ([ae07596](https://github.com/Yonomi/yonomi-device-widgets/commit/ae075962f10ebae5821c656395e1f1246eec6bd2))

# [2.9.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.8.1...v2.9.0) (2022-04-25)


### Bug Fixes

* **color_slim_widget.dart:** Implement color slim widget ([5509ded](https://github.com/Yonomi/yonomi-device-widgets/commit/5509ded736d302104c978d4ce7873a6a77d56914))
* Add color to the trait builders ([cf07567](https://github.com/Yonomi/yonomi-device-widgets/commit/cf075677b13f505b3a45352b6a8b314b214df8bf))
* Fix color picker dialog ([d3888d7](https://github.com/Yonomi/yonomi-device-widgets/commit/d3888d79dd833614d9ee6ecce3932fdb4a9be03a))
* Fix defects by state finding helpers and improve code coverage ([692ee25](https://github.com/Yonomi/yonomi-device-widgets/commit/692ee254f1b94f42edb042883e68c43ceca7d255))
* Fix presentation of color widgets ([0cdc1c2](https://github.com/Yonomi/yonomi-device-widgets/commit/0cdc1c2db46ee6d2803210c609c133472301ce1b))
* Implement color provider ([709d910](https://github.com/Yonomi/yonomi-device-widgets/commit/709d910f7e840ecb1209161c8e9a9c14d2c27ba9))
* Implement full size color widget ([23b0775](https://github.com/Yonomi/yonomi-device-widgets/commit/23b07754cc826b8e3bab0f7e5e4d3eef6b9e8631))
* Make test provider properly reflect state and fix tests ([cc3c63c](https://github.com/Yonomi/yonomi-device-widgets/commit/cc3c63c1e99a85c1dcbcab4298fcd46c5e360af1))
* Show a tile with progress and error indicators to keep look consistent ([b0c9b22](https://github.com/Yonomi/yonomi-device-widgets/commit/b0c9b22769b3916907a59eb2b8795c2014806462))


### Features

* Scaffold for new color trait ([361420d](https://github.com/Yonomi/yonomi-device-widgets/commit/361420db950fea3450229d96b243e629170bacdd))

## [2.8.1](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.8.0...v2.8.1) (2022-03-03)


### Bug Fixes

* cleanup circleci ([aadfa0c](https://github.com/Yonomi/yonomi-device-widgets/commit/aadfa0c9c307f20e9a30ffac81a89c9f103e7391))
* removed token and cleanup documentation to regenerate ([ffab8b4](https://github.com/Yonomi/yonomi-device-widgets/commit/ffab8b4c77d959719f2c2e235f928f039bca0db3))
* uncommented documentation generation step to test ([a27c4d9](https://github.com/Yonomi/yonomi-device-widgets/commit/a27c4d9df63259962f00852318ea7386f9be6b25))

# [2.8.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.7.0...v2.8.0) (2022-02-21)


### Bug Fixes

* document generation ([c53aa07](https://github.com/Yonomi/yonomi-device-widgets/commit/c53aa07d0b7d0412953a4de6a2d467ac4412f140))
* fix a/c to mockups ([8e9ac05](https://github.com/Yonomi/yonomi-device-widgets/commit/8e9ac05948d92ad21b45280ef0aa33436dd017a4))
* heat setpoint working ([be1113f](https://github.com/Yonomi/yonomi-device-widgets/commit/be1113fb64cd97e2baeb3ec8b10a326a22668ecd))
* provider test ([7f6345e](https://github.com/Yonomi/yonomi-device-widgets/commit/7f6345e7b95cd6b82af24886e870d69d94b8693b))
* regenerate mocks ([5b94a08](https://github.com/Yonomi/yonomi-device-widgets/commit/5b94a08f442d6f708c9f2129cc4cbb92b3682cc9))


### Features

* added settargettemperature ([31c5aba](https://github.com/Yonomi/yonomi-device-widgets/commit/31c5aba087e78501a469395526f1e9cf64509a33))

# [2.7.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.6.0...v2.7.0) (2022-02-17)


### Features

* **DX-353:** display IsJammed State if device supports it ([#37](https://github.com/Yonomi/yonomi-device-widgets/issues/37)) ([e82f8d4](https://github.com/Yonomi/yonomi-device-widgets/commit/e82f8d41c4c140b14f5dcebc814707fccf3cf2ff))

# [2.6.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.5.1...v2.6.0) (2022-01-25)


### Bug Fixes

* Fix unknown primary trait display to be same style as other primary traits on detail screen ([6a835bd](https://github.com/Yonomi/yonomi-device-widgets/commit/6a835bdb034c946730a513caedcb37df8a303eae))
* Thermostat will have multiple states not multiple traits ([36b323b](https://github.com/Yonomi/yonomi-device-widgets/commit/36b323b205d6d6ee1e93b16f916dfc12f621d781))
* Thermostats can have multiple traits and states so make sure target temp is returning the target temp state ([8ffe24e](https://github.com/Yonomi/yonomi-device-widgets/commit/8ffe24e969ee47835a70cb12af54bc68cacb72f3))
* **detail_screen.dart:** Add additional test and fix what happens if a device for some reason has no traits ([0286c5b](https://github.com/Yonomi/yonomi-device-widgets/commit/0286c5bf6fc0b1a7306c4a5a416c22a4cda4e188))
* **thermostat_provider.dart:** Fix thermostat trait casting to prevent type cast error ([51b556a](https://github.com/Yonomi/yonomi-device-widgets/commit/51b556a6cdafef9c18da61d217b1d64c55923517))


### Features

* Add cursory display of target temperature ([89ddaf2](https://github.com/Yonomi/yonomi-device-widgets/commit/89ddaf22edb57afb3afe677819c1547475f1c803))
* Add simple display of target temperature ([c648bb6](https://github.com/Yonomi/yonomi-device-widgets/commit/c648bb6f27c8eab0e9fb9a994dedd8bf169065f7))

## [2.5.1](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.5.0...v2.5.1) (2022-01-19)


### Bug Fixes

* Align icons in trait list between expandables and non expandables ([cf17d1d](https://github.com/Yonomi/yonomi-device-widgets/commit/cf17d1d83d2e38dd549afcfb240a9b1625ef71bd))
* Fix the lock icons not updating on actions ([1da3ac3](https://github.com/Yonomi/yonomi-device-widgets/commit/1da3ac312019d16b48e7bb093c95cb6b3f5cd33c))

# [2.5.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.4.0...v2.5.0) (2022-01-10)


### Bug Fixes

* **battery_widget.dart,detail_screen.dart,lock.dart,power_widget.dart,widget_style_constants.dart:** Make icons and text colors on widgets and icons customizable ([d4510a4](https://github.com/Yonomi/yonomi-device-widgets/commit/d4510a4f04f3caf6b877da56e42c0e9fb7998487))
* **battery_widget.dart,detail_screen.dart,lock.dart,power_widget.dart,widget_style_constants.dart:** Make icons and text colors on widgets and icons customizable ([29734b2](https://github.com/Yonomi/yonomi-device-widgets/commit/29734b29b09bd148e10fde9ff5a05fe3ef741cc1))
* **detail_screen.dart:** Add accordion import that seemed to get lost somewhere ([160408a](https://github.com/Yonomi/yonomi-device-widgets/commit/160408ab67a08f39097c50d53defe40b1d8effc4))
* **detail_screen.dart:** Update styling to better match figma ([cb661c0](https://github.com/Yonomi/yonomi-device-widgets/commit/cb661c02679ad42ca94167348426b0b4163e81a3))


### Features

* Add slim lock for multi trait list ([b0f8176](https://github.com/Yonomi/yonomi-device-widgets/commit/b0f81760702f8204cb77d18270d18192774a6f39))

# [2.4.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.3.0...v2.4.0) (2022-01-05)


### Bug Fixes

* **battery_level_trait_provider.dart:** Make match power provider though we probably should handle this differently ([805dac2](https://github.com/Yonomi/yonomi-device-widgets/commit/805dac2a8a7b83b0b19a006d12c4629f4131ca01))
* **battery_level_trait_provider.dart:** Now correctly report the battery level ([6cf915e](https://github.com/Yonomi/yonomi-device-widgets/commit/6cf915e5150a07e13ea3f600a01968c8bc516afd))
* **battery_widget.dart:** add a percent sign for battery ([5a0d398](https://github.com/Yonomi/yonomi-device-widgets/commit/5a0d39892254186942594169b2fffb6651d1bf86))
* **battery_widget.dart:** Add text battery level ([33c87d5](https://github.com/Yonomi/yonomi-device-widgets/commit/33c87d5a4222c459e86254bc4cff029f41c82a2d))
* **battery_widget.dart:** Make battery widget battery level text on next line ([27c059f](https://github.com/Yonomi/yonomi-device-widgets/commit/27c059f3ceb5a09d65c3d72e1d939153226444fb))
* **battery_widget.dart,battery_widget_test.dart:** Correctly display name and battery level on the actual widget of a battery trait primary object ([5fd31f1](https://github.com/Yonomi/yonomi-device-widgets/commit/5fd31f1413f754c7da98c4299c4c2b2194727e58))
* **detail_screen.dart:** Correct look and feel on battery trait ([1d35f97](https://github.com/Yonomi/yonomi-device-widgets/commit/1d35f9765fc1dfce8210d88eaece6ce7bac03e43))
* **lib/traits/battery_widget.dart:** Correct widget text to match figma ([f24c319](https://github.com/Yonomi/yonomi-device-widgets/commit/f24c3190f94075dd0fec9bb52cdc7dd62e57e81b))
* **widget_style_constants.dart-detail_screen.dart:** Add correct accent colors according to figma ([460405c](https://github.com/Yonomi/yonomi-device-widgets/commit/460405c5a79e9174043b859d2066ad6c38e2d999))


### Features

* **battery_level_icon.dart,battery_level_provider.dart,battery_widget.dart,widget_style_constants.dart,battery_widget_test.dart,battery_widget_test.mocks.dart:** Add battery icon display content ([55bdf09](https://github.com/Yonomi/yonomi-device-widgets/commit/55bdf091116780e581aa976759de397a3838a316))
* **detail_screen.dart,pubspec.yaml:** Use accordions for subtraits ([e501169](https://github.com/Yonomi/yonomi-device-widgets/commit/e501169f5f6d14a52468fc05995e5d6678b80b38))


### Reverts

* Revert "build(pubspec.yaml): Fix to use material icons for accordion" ([6a1c304](https://github.com/Yonomi/yonomi-device-widgets/commit/6a1c304ebc2192ea8c00875b5ccb5dddcdda91fb))

# [2.3.0](https://github.com/Yonomi/yonomi-device-widgets/compare/v2.2.0...v2.3.0) (2021-12-17)


### Features

* **power_widget:** handle loading, error and normal UI states for PowerWidget ([90cfe2c](https://github.com/Yonomi/yonomi-device-widgets/commit/90cfe2cce08c857e733c10869ce8447c2a5ebef7))

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
