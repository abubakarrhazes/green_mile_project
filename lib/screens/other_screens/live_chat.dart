import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:green_mile/widgets/date_lable.dart';
import 'package:green_mile/widgets/glowing_action_button.dart';
import 'package:green_mile/widgets/message_own_tile.dart';
import 'package:green_mile/widgets/message_tile.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}


class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController _controller = TextEditingController();
   bool show = false;
   int popTime = 0;
   FocusNode focusNode = FocusNode();


    @override
  void initState() {
    super.initState();
      focusNode.addListener(() {
     if(focusNode.hasFocus){
      setState(() {
        show = false;   
      });

     }
    }); 
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle:true,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
             padding: const EdgeInsets.only(
                right:20
              ),
            itemBuilder:(context) =>[
                PopupMenuItem(  
                    onTap:(){
                       Navigator.pop(context);
                    },
                    child: const Text('back',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, 
                        color:  Colors.deepPurpleAccent,
                        fontSize: 14.0,      
                    )
                    ),
               ),
            ],
             icon: const Icon(Icons.menu,
               color: Colors.deepPurpleAccent,
               ),
          )
        ],
        title: const Text('Support Chat',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            right: 20
          ),
          child: IconButton(
             padding: const EdgeInsets.only(
              left:20
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                 color: Colors.deepPurpleAccent),
          ),
        ),
      ),
      body: Column(// expanded
        children: <Widget>[
          const DateLable(),
          const Center(
               child: Text('A specialist joined the chat',
              style: TextStyle(
              color:Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 13
              ),
              ),
               ),
              const  SizedBox(height:10.0),
              Expanded(
                child: Padding(
                 padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0    
                 ),
                 child: ListView(
                        children:const [
                        MessageTile(
                          message:'Hi jennifer, how can i help you today',
                          messageDate:'9:37 PM'
                        ),
                        MessageOwnTile(
                          message:'Hi Hannah, i want to report a human abuse case,Can you help me out',
                          messageDate:'9:38 PM'
                        ),
                        MessageTile(
                          message:'Can you tell me more about the problem?',
                          messageDate:'9:39 PM'
                        ),
                        MessageOwnTile(
                          message:'I am so traumatized and currently in a very bad condition',
                          messageDate:'9:40 PM'
                        ),
                        MessageTile(
                          message:'Pls do not be in such manner,Am here for you',
                          messageDate:'9:41 PM'
                        ),
                        MessageOwnTile(
                          message:'I do not know where to start from now',
                          messageDate:'9:42 PM'
                        ),
                        ]
                 ),
                         ),
              ),
            WillPopScope(
              child: SafeArea(
                    bottom: true,
                    top: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right:BorderSide(
                          width: 2,
                          color:Theme.of(context).dividerColor,
                        ),
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: InkWell(
                        child: const Icon(Icons.emoji_emotions_outlined),
                        onTap: () {
                          setState(() {
                            focusNode.unfocus();
                            focusNode.canRequestFocus = false;
                            show = !show; // show is the negative of show(true)
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                      ),
                      child: TextField(
                        focusNode: focusNode,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines:5,
                        minLines:1,
                        controller: _controller,
                        textCapitalization: TextCapitalization.sentences,
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Send a Message',
                          hintStyle: TextStyle(
                            color:Colors.grey
                            ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 20.0,
                    ),
                    child: GlowingActionButton(
                      color: Colors.deepPurpleAccent,
                      icon:Icons.send_rounded,
                      onpressed:() {}
                    ),
                  )
                ],
              ),
              show ? emojiSelect() : const SizedBox.shrink(), // container()
              // if show is true which is fALSE show emojiselect else show empty sizedbox
                      ],
                    ),
                  ),
                    onWillPop: (){
        if(show){ // if show is true
          setState(() {
            show = false;
          });
        }
         else{
            Navigator.of(context);
          }
          return Future.value(false);
      },
            ),
        ]
      ),
    );
  }

    Widget emojiSelect() {
    return SizedBox(
      height:250,
      child: EmojiPicker(
          onEmojiSelected: (catogory, emoji) {
          setState(() {
              _controller.text = _controller.text + emoji.emoji;
            });
          },
           config:const Config(
              columns:7,
              showRecentsTab: true,
              emojiSizeMax:32.0,
              recentsLimit: 28,
              categoryIcons:  CategoryIcons(),
              initCategory: Category.SMILEYS,
              buttonMode: ButtonMode.MATERIAL 
            )
          
          ),
    );
  }
}
