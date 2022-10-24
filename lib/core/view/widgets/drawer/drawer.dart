//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
//
// import '../../../constants/app_colors.dart';
// import '../../../constants/assets.dart';
// import '../../../constants/constatnts.dart';
//
// class AppDrawer extends StatelessWidget {
//   const AppDrawer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PreferencesCubit, PreferencesState>(
//       builder: (context, state) {
//         return Container(
//           width: 300,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.white9,
//                 offset: Offset(0, 7),
//                 blurRadius: 6,
//                 spreadRadius: 0,
//               )
//             ],
//             color: AppColors.white10,
//           ),
//           child: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Stack(
//                     alignment: AlignmentDirectional.topEnd,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsetsDirectional.all(12.0),
//                         child: IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: SvgPicture.asset(Assets.icClose),
//                         ),
//                       ),
//                       Center(
//                         child: SvgPicture.asset(Assets.brimoreRoundedLogo),
//                       )
//                     ],
//                   ),
//                   Text(
//                     currentUser?.name ?? '',
//                     style: const TextStyle(
//                       color: AppColors.black,
//                       fontWeight: FontWeight.w700,
//                       fontStyle: FontStyle.normal,
//                       fontSize: 20.0,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     '#${currentUser?.code ?? ''}',
//                     style: const TextStyle(
//                       color: AppColors.black,
//                       fontWeight: FontWeight.w400,
//                       fontStyle: FontStyle.normal,
//                       fontSize: 18.0,
//                     ),
//                     textAlign: TextAlign.start,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(Assets.user),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.popAndPushNamed(context, ProfileScreen.id);
//                         },
//                         child: Text(
//                           context.l10n.my_profile,
//                           style: const TextStyle(
//                             color: AppColors.primary,
//                             fontWeight: FontWeight.w600,
//                             fontStyle: FontStyle.normal,
//                             fontSize: 16.0,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                   ListView(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     children: [
//                       ListTile(
//                         leading: SvgPicture.asset(Assets.movie),
//                         title: Text(
//                           context.l10n.dashboard,
//                           style: style(),
//                           textAlign: TextAlign.start,
//                         ),
//                         onTap: () async {
//                           Navigator.pop(
//                             context,
//                           );
//                         },
//                       ),
//                       ListTile(
//                         leading: Image.asset(
//                           Assets.barcodeIcon,
//                           width: 25,
//                           height: 25,
//                         ),
//                         title: Text(
//                           context.l10n.quick_order,
//                           style: style(),
//                           textAlign: TextAlign.start,
//                         ),
//                         onTap: () {
//                           Navigator.popAndPushNamed(
//                             context,
//                             QuickOrderSearchScreen.id,
//                           );
//                         },
//                       ),
//                       ListTile(
//                         leading: SvgPicture.asset(Assets.grocery),
//                         title: Text(
//                           context.l10n.my_orders,
//                           style: style(),
//                           textAlign: TextAlign.start,
//                         ),
//                         onTap: () {
//                           Navigator.popAndPushNamed(
//                             context,
//                             MyOrders.id,
//                           );
//                         },
//                       ),
//                       if (state.hasOffer)
//                         ListTile(
//                           leading: SvgPicture.asset(Assets.currentGifts),
//                           title: Text(context.l10n.current_gifts,
//                               style: style(), textAlign: TextAlign.start),
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       if (state.isEmployee || state.walletIsActive)
//                         ListTile(
//                           leading: const Icon(
//                             Icons.wallet,
//                             color: AppColors.primary,
//                           ),
//                           title: Text(
//                             context.l10n.my_wallet,
//                             style: style(),
//                             textAlign: TextAlign.start,
//                           ),
//                           onTap: () {
//                             Navigator.pushNamed(context, WalletScreen.id);
//                           },
//                         ),
//                       ListTile(
//                         leading: Image.asset(
//                           Assets.treeIcon,
//                           width: 23,
//                           height: 23,
//                         ),
//                         title: Text(
//                           context.l10n.my_tree,
//                           style: style(),
//                           textAlign: TextAlign.start,
//                         ),
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       ListTile(
//                         leading: SvgPicture.asset(Assets.addNewMeber),
//                         title: Text(
//                           context.l10n.new_members,
//                           style: style(),
//                           textAlign: TextAlign.start,
//                         ),
//                         onTap: () {
//                           Navigator.popAndPushNamed(
//                             context,
//                             NewMembersScreen.id,
//                           );
//                         },
//                       ),
//                       ListTile(
//                         leading: SvgPicture.asset(Assets.share),
//                         title: Text(context.l10n.create_new_member,
//                             style: style(), textAlign: TextAlign.start),
//                         onTap: () async {
//                           initializeDeepLinkData(context);
//                         },
//                       ),
//                       ListTile(
//                         leading: SvgPicture.asset(Assets.magazine),
//                         title: Text(context.l10n.portfolio,
//                             style: style(), textAlign: TextAlign.start),
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       ListTile(
//                         leading: SvgPicture.asset(
//                           Assets.training,
//                           width: 18,
//                           height: 18,
//                         ),
//                         title: Text(
//                           context.l10n.training,
//                           style: style(),
//                           textAlign: TextAlign.start,
//                         ),
//                         onTap: () {
//                           Navigator.popAndPushNamed(
//                             context,
//                             TrainingPage.id,
//                           );
//                         },
//                       ),
//                       if (state.ticketsIsActive)
//                         ListTile(
//                           leading: const Icon(
//                             Icons.person,
//                             color: AppColors.primary,
//                           ),
//                           title: Text(
//                             context.l10n.customers_service,
//                             style: style(),
//                             textAlign: TextAlign.start,
//                           ),
//                           onTap: () async {},
//                         ),
//                       ListTile(
//                         leading: SvgPicture.asset(Assets.addNewMeber),
//                         title: Text('Open sign up screen',
//                             style: style(), textAlign: TextAlign.start),
//                         onTap: () {
//                           Navigator.popAndPushNamed(
//                             context,
//                             SignupScreen.id,
//                             arguments: {
//                               DEEP_LINKING_USER_ID: currentUser?.id.toString(),
//                               DEEP_LINKING_USER_NAME: currentUser?.name,
//                               DEEP_LINKING_USER_CODE: currentUser?.code,
//                               DEEP_LINKING_IS_EMPLOYEE: state.isEmployee,
//                             },
//                           );
//                         },
//                       ),
//                       ListTile(
//                         leading: const Icon(
//                           Icons.language,
//                           color: AppColors.primary,
//                         ),
//                         title: Text(context.l10n.change_language,
//                             style: style(), textAlign: TextAlign.start),
//                         onTap: () async {
//                           final language =
//                               context.read<PreferencesCubit>().state.language;
//                           if (language == 'ar') {
//                             context.read<PreferencesCubit>().setLanguage('en');
//                           } else {
//                             context.read<PreferencesCubit>().setLanguage('ar');
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   ListTile(
//                     leading: SvgPicture.asset(Assets.logout),
//                     title: Text(
//                       context.l10n.logout,
//                       style: const TextStyle(
//                         color: AppColors.red,
//                         fontWeight: FontWeight.w700,
//                         fontStyle: FontStyle.normal,
//                         fontSize: 18.0,
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                     onTap: () {
//                       logout(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   TextStyle style() => const TextStyle(
//         color: AppColors.black,
//         fontWeight: FontWeight.w600,
//         fontStyle: FontStyle.normal,
//         fontSize: 16.0,
//       );
// }
