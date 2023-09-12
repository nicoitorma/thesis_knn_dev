'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "de26771e214089c24907bafc5d782f7b",
".git/config": "7cbb86b4278e4c1446031a7ef121628f",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "9ea2258d68f49a043d2439f3d60aa5d5",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "6336c1be866eb16f2765aced138c40fd",
".git/logs/refs/heads/master": "6336c1be866eb16f2765aced138c40fd",
".git/logs/refs/remotes/origin/master": "d0ce80b1b2e3bbc105e07005ddfa0e8f",
".git/objects/00/559eeb290fb8036f10633ff0640447d827b27c": "7fbd4486d5ea862eb2c1d2a07b06b395",
".git/objects/03/c531a7a4eadfbb97e5434401927ee31890cf33": "fe6b24f60048b7f218835d95c2c650ae",
".git/objects/0b/85bcdb86bf9e9f9fda81b13cec9c9349d47d77": "77cbf4b6cc88e2471afd14a98ef2e0ed",
".git/objects/1b/65bc4e970a5a5677441a6caf449b0153018c0f": "7cce2901eb41cdd570180e39bfa6be15",
".git/objects/1e/bf993c04c08e17a0122730f8d7ce6e139c8bad": "eeb4f0d71f24758335fe1753273ad6c2",
".git/objects/1f/686edd1465272558af328ca43cb7189a0059e6": "5e83820f6d3e5392693d45bc239b2b61",
".git/objects/21/f448c10653d831c19d3adbed876166d6326c3b": "f4d6d1a298b63f97ddfd57b3864e2afc",
".git/objects/22/0491689d6f564407e4416c0810d15f1d3e76e7": "87dba7fd9d1e133be1f7bf2bfe09e019",
".git/objects/23/681ca4befc116e81a0098398ee0852dae26916": "08bc37ff2f86bad2f2291e611d7110c5",
".git/objects/25/597e034a834660ef38d4244aeac7818b94ffee": "4a66e5a69af66b98607321afdab4a976",
".git/objects/27/bcfd7c581e907b88bf655f823a2c571c238337": "b06607b68f6b74e2935e8f2360cab688",
".git/objects/29/d4b49c725e56266f99b8945cafbd4eacbbf6a8": "d6c729233479921600736e3f8e642fda",
".git/objects/2f/0a8fe5cbdcb1838785b0369ba5ef495099d75e": "e64d20c0c19a4ac3466fb4cb142bba25",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/35/b208ebe6223c67a3debdf5a0ae8a4a59d7a820": "7f71421776b332caa27f94dc0e53339f",
".git/objects/36/cab7eb8de291b667e1037932c53997bf4f2750": "d17b8ec1e94d7527b169ea249736960a",
".git/objects/37/7580cbf691d03aea79c63a3a251b1b48ac01f1": "c196d282a50e3c372b4445c6b8868297",
".git/objects/40/fd68d26dc701cfd99ab80f287701010507fa6f": "edfe52e667478d65e9e3fb47ac178299",
".git/objects/48/f53e60ac717dae7076c6f2396302cfe2be97e9": "3c472954d444be5fa4c951fc7c74491b",
".git/objects/49/6e7a7b8cf2caa0ab1875208670a3e6b0cad322": "8ce0d9bb5e9e6c4d8d6485a5db83cea6",
".git/objects/4e/00ce7905fcafce07ecadcb95e52b38a3b0a450": "cefa811b8c7d004c2ac1121fcaf99780",
".git/objects/51/34e6402246228fb7f58ce8fe76727a61d99a62": "6b5e5b48febe40daec7062aecdc3b39f",
".git/objects/5d/381503a3ab129f7fa060bd01408306c3dfe96a": "6ca81723eb02c6febb8ed5b62b54883f",
".git/objects/62/a01d6826913d9efa140d2e9f4bc0f13918e607": "44ba2af6a4f05cb190463143170ae010",
".git/objects/66/9bb25f2f390fdb3d85c42e055fb6368d6a499d": "5fc1202464ca40ef19127cfe06a0919d",
".git/objects/69/495eb3c31238d2fadeb81e5db5909f84026642": "741dfb9fba325c05bdb812a9147a4037",
".git/objects/70/010cc4761157d9d7cc2d082cf342e63fe1190a": "baf21d1dacab382149ee93266543ff40",
".git/objects/80/829abed56b661abb874999623ff66f6ed2ab2f": "c2855ef36653e94a8bcb98d2b4cd74b4",
".git/objects/85/4bea84134842b10db04dfdc942d82f0df0d84a": "cf2376f6bc9d09a901b1a794e3ecc360",
".git/objects/86/c805ab714c16dd6443cc32f0d7752b2c7eb16c": "3a66f5d4415d80a217b7a9849696ae93",
".git/objects/88/3ace48bfd87f57c964d08a8c61a96091f607c1": "b7137d89ca34096e337a9c0664bc1b08",
".git/objects/89/191c2831db42d1ed56276acdc3e30dfe062436": "cfc81282455d57c6ed27cf302b36ffe7",
".git/objects/9f/0c71b70a49664ced448c63edc9c4ff2bf8cf4a": "bfe12b0c8078a4f477699ecebf5fd96c",
".git/objects/ac/9335eccf2513a5a60112d1d78f81db3e8e25fc": "532f53fc433b4f4714ef6753ff92b67c",
".git/objects/b2/2fdb2d1fa6a3bced274617d58f6ab432bb0d8b": "1b405e4dfab487f51d41422d52600614",
".git/objects/b2/c677e06b0aa8a213f7e17720672fc46661d81a": "9ecd89d723a32533e01769bc23157687",
".git/objects/b9/7e9767c2bd94f9b909b7e12621851d1bd94c6f": "1bfde0d46f63f7bf5d6638e09c0d1403",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/d4/03f6bff50f0b08310ad0a686e692d95825f60f": "dbfe18cfc8b926a1ed0c12c612f61a65",
".git/objects/d8/c595406f6dd1549a102e3ad9b12234f033a9be": "e2a6d7bfb32d8e4641daca73e8557d84",
".git/objects/df/a37315dc29b590b4ab0b2577c1a82a38c4b567": "d315aeb4eedbdcfd9fbb0451d312fcfe",
".git/objects/e4/6eeaa87f42eff412735ee657285ccf3c79f91b": "6cfab61e4906734b01919b24998a10b8",
".git/objects/e5/4400779d73e5a2c9e3918ec96bc7c7c1b20155": "c2b5da80224b108306a57b8f8d35c529",
".git/objects/e8/1726a546ec089b97165a7b39782de2dbd4e5bc": "98c025a4e870981da8e07ec2cf6607ac",
".git/objects/f1/7d1a4e24abc969533503778707be33f424042f": "3d482750faba3132a798023f6b97c09c",
".git/objects/f2/0c8d8559b687a3dc42ec7c1f40a3843914e86f": "63a42bb7c4490227671564478067945a",
".git/objects/fa/d2c9523a68b69c16327bf970ff61cba2522b08": "06820c6ded540ee11796be9aa9242ebf",
".git/refs/heads/master": "a276bee70be0c2a02e42225b7ee0f2a6",
".git/refs/remotes/origin/master": "a276bee70be0c2a02e42225b7ee0f2a6",
"assets/AssetManifest.bin": "4f60823dae1c31bcb22c436e5dd8d0ba",
"assets/AssetManifest.json": "f51f40213ff400428fcfb7820f0f2c37",
"assets/assets/imgs/bg.png": "90a9792f04253c301ca08911ffab48f1",
"assets/assets/imgs/icon.png": "4a1596c9107da8d1f371f5a39dc40cf6",
"assets/assets/imgs/logo.png": "f757bf403e1673d75498011950131ded",
"assets/assets/knn_model/CSDataset.csv": "04a3b4643889bae3517a9d654d964147",
"assets/assets/knn_model/ISDataset.csv": "e8dd3a7667bca8558994abd79074491e",
"assets/assets/knn_model/ITDataset.csv": "17fed8648b1f856b87e9bcdfb738dc68",
"assets/FontManifest.json": "8ef2e184f19c632e9089292071e62ad7",
"assets/fonts/MaterialIcons-Regular.otf": "5e1102ef477c0c33594e00b07c4b0a29",
"assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/NOTICES": "430530a93ee8d0c9985b4a1bb9733d2c",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "aae063eb80023a3db12b34a8d968e08a",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "810e091bf7a0b2e6d3cbd6a790ab42d8",
"icons/Icon-512.png": "0a5e37965e4839b9847ff82e9c64672a",
"icons/Icon-maskable-192.png": "810e091bf7a0b2e6d3cbd6a790ab42d8",
"icons/Icon-maskable-512.png": "0a5e37965e4839b9847ff82e9c64672a",
"index.html": "7e019721d98e84ea56f32ad8f1bbc7b4",
"/": "7e019721d98e84ea56f32ad8f1bbc7b4",
"main.dart.js": "e8f332aab94bef58419d2bada54caf22",
"manifest.json": "3e724b16dc02f15c7c4e0e514c49e770",
"splash/img/dark-1x.png": "e88e70bbe1fa753bf11627898064a981",
"splash/img/dark-2x.png": "0f4b6217699b6dbe28e832dfa71ba564",
"splash/img/dark-3x.png": "9617c6552a42cd714774731cee5e6e17",
"splash/img/dark-4x.png": "078d199880084e47c682a20376e36ed0",
"splash/img/light-1x.png": "e88e70bbe1fa753bf11627898064a981",
"splash/img/light-2x.png": "0f4b6217699b6dbe28e832dfa71ba564",
"splash/img/light-3x.png": "9617c6552a42cd714774731cee5e6e17",
"splash/img/light-4x.png": "078d199880084e47c682a20376e36ed0",
"version.json": "686c041971e299538276613107e82d64"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
