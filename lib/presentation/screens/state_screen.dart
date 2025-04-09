import 'package:flutter/material.dart';
import 'package:chicken_mines/common/typography/app_typography.dart';
import 'package:chicken_mines/gen/assets.gen.dart';

import '../../common/colors/app_colors.dart';

class StateScreen extends StatelessWidget {
  const StateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.icons.bg.path,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(height: 10,),
                _buildSectionTitle('Origins of the Chicken: From Wild Bird to Domestication'),
                _buildSectionContent(
                  'The chicken (Gallus gallus domesticus) has its roots in Southeast Asia, where it was domesticated from the red junglefowl thousands of years ago. Initially valued for its eggs and meat, the chicken quickly spread across the world, becoming one of the most commonly farmed animals. Its significance grew in agriculture, cuisine, and even mythology, symbolizing fertility, courage, and sacrifice in various cultures.',
                ),
                _buildSectionTitle('The Chicken in Popular Culture'),
                _buildSectionContent(
                  'Beyond its role in food production, the chicken has cemented its place in folklore, literature, and entertainment. It has been portrayed as both a humorous and wise character in fables such as "Chicken Little" and "The Little Red Hen." Chickens often symbolize cowardice in Western idioms, yet in other traditions, they represent bravery and vigilance.',
                ),
                _buildSectionTitle('Chickens in Video Games: A Surprising Icon'),
                _buildSectionContent(
                  'The chicken has found an unexpected yet lasting role in the gaming industry. It has appeared in multiple genres, from RPGs to first-person shooters, often with humorous or legendary status.',
                ),
                _buildBulletPoints([
                  'The Legend of Zelda series – The infamous "Cucco" is a seemingly harmless farm animal that becomes a vengeful force when attacked by the player.',
                  'Minecraft – Chickens are essential for farming, providing eggs and feathers, making them an integral part of survival and crafting mechanics.',
                  'Counter-Strike – Originally a simple background detail, the chicken evolved into a beloved mascot.',
                  'Diablo II and World of Warcraft – Both games include references to chickens as part of their Easter eggs and comedic relief moments.',
                ]),
                _buildSectionTitle('Why Are Chickens So Popular in Games?'),
                _buildBulletPoints([
                  'Universality and Familiarity – Almost everyone recognizes a chicken, making it a relatable character.',
                  'Humor and Surprise – Chickens often serve as comic relief, either through absurd mechanics or unexpected behaviors.',
                  'Symbolic Role – Chickens embody themes of survival, food, and consequence, making them versatile for storytelling.',
                  'Easter Eggs and Secrets – Developers enjoy using chickens for hidden surprises, often rewarding curious players.',
                ]),
                _buildSectionTitle('The Chicken’s Legacy: More Than Just a Farm Animal'),
                _buildSectionContent(
                  'From a domesticated bird to a cultural and gaming phenomenon, the chicken has transcended its humble origins. Its presence in games continues to grow, with each new title finding creative ways to integrate it into mechanics, humor, or narrative.',
                ),
              ],
            ),
          ),),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: AppTypography.headline1.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.purple,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        content,
        style: AppTypography.headline1.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.purple,
        ),
      ),
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) => _buildBulletPoint(point)).toList(),
    );
  }

  Widget _buildBulletPoint(String point) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: AppTypography.headline1.copyWith(
              fontSize: 16,
              color: AppColors.purple,
            ),
          ),
          Expanded(
            child: Text(
              point,
              style: AppTypography.headline1.copyWith(
                fontSize: 16,
                color: AppColors.purple,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
