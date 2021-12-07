// Copyright 2021 Pujit Mehrotra
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Map of symptoms to images
/// Key (string): Display name of symptom
/// Value (string): image source
///
/// There were two choices to represent the available image set: a list-like structure and a map-like structure.
/// A list would enable the most abstraction and the most flexibility, while a map would provide the most in-code clarity, efficiency (in terms of redundancy and LOC-per logical data group), and flexibility.
/// The scope of the application does not demand high levels of abstraction or flexibility, and I don't foresee it ever demanding it to levels (i.e. requiring a DSL or custom internal framework)
/// outweighing clarity and concision.
///
/// Note that I heavily considered making the Values a Set of image sources to support alternative/multiple images for the same symptom, in case one of the images was unclear,
/// or if the doctor wanted to make sure the patient understood the image correctly, or if they wanted to determine the severity of a symptom.
/// I didn't because we didn't get that far, and it's a bad idea to build features in advance--as I've learned from experience, unfortunately. It'll slow current work, and the feature may never be built :(
/// Learn from my past mistakes, padawan.
const symptomImages = {
  'Pregnancy': 'https://pbs.twimg.com/media/EoQXSX-WEAspgv_.jpg',
  'Cough':
      'https://media.istockphoto.com/photos/coughing-man-picture-id184386430?k=20&m=184386430&s=612x612&w=0&h=Aen7QIZtbyFMk-JQBF_RJgVahnWeJitJvvPtc2RMrrE=',
  'Headache':
      'https://hmh-ea97.kxcdn.com/host_images/when-will-the-ringing-in-my-ear-go-away-GettyImages-643310504.jpg',
  'Stomachache':
      'https://img-static.popxo.com/tr:w-600,rt-auto,q-40/app_photos/images/3854/original/Piles-1.jpg',
  'Chest Pain': 'https://cdn.ghanaweb.com/imagelib/pics/976/97681294.295.jpg',
  'Neck Pain':
      'https://www.corebalancecentre.ca/uploads/1/3/7/7/137750941/unknown-4_orig.jpeg',
  'Nausea':
      'https://www.verywellhealth.com/thmb/gI--Aogxxlxdcnnv-pzfQpPU4fk=/3435x2576/smart/filters:no_upscale()/young-african-american-woman-feeling-nausea-during-breakfast-time-at-dining-room--907546156-5a90427f3037130037020d92.jpg',
  'Dizziness':
      'https://www.thehealthy.com/wp-content/uploads/2018/02/14-Vertigo-Treatments-to-Finally-Cure-Your-Dizziness.jpg?resize=1024,683'
};
