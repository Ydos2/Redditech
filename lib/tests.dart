/*
        Card(
          borderOnForeground: true,
          color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
          child: Container(
            color: USERSETTINGS.dark_mode ? colorGreyHard : colorWhite,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const SizedBox(width: 20.0),
                Column(
                  children: <Widget>[
                    Row(
                      children: [
                        if (postRand[index].imageUrl.toString() != "" &&
                            postRand[index].imageUrl.toString() != null)
                          CircleAvatar(
                            radius: 30.0,
                            backgroundColor: USERSETTINGS.dark_mode
                                ? colorWhite
                                : colorBlack,
                            child: Image.network(
                              postRand[index].imageUrl.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              //"r/Unity3D",
                              postRand[index].subReddit,
                              style: TextStyle(
                                color: USERSETTINGS.dark_mode
                                    ? colorWhite
                                    : colorBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              //"Publiée par u/Ydos * 10 mois",
                              postRand[index].author,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                // Image
                Text(
                  //"Blablabla dg,jisgpzgjzpogjzpojpz\nolsfkjzpgjpqzgjipoa^qzbripoa^bvniraop^bri\ndpsoqjpqvjpzdvkjpdvjpodvdvsbfs,kl dafspo",
                  postRand[index].subtext.toString(),
                  style: TextStyle(
                    color: USERSETTINGS.dark_mode ? colorWhite : colorBlack,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                if (sample != "" && sample != null)
                  Image.network(
                    sample,
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300,
                  ),
                const SizedBox(height: 8),
                const Divider(),
                // Bottom button
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      child: const Icon(Icons.arrow_upward, color: colorGrey),
                      onPressed: () {
                        postRand[index].upvote(1);
                        vote = 1;
                      },
                    ),
                    Text(
                      //USERSETTINGS.hide_up ? 'Vote' : '42',
                      USERSETTINGS.hide_up
                          ? 'Vote'
                          : (postRand[index].upvotes + vote).toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: colorGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    if (USERSETTINGS.hide_down == false)
                      TextButton(
                        child:
                            const Icon(Icons.arrow_downward, color: colorGrey),
                        onPressed: () {
                          postRand[index].upvote(-1);
                          vote = -1;
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),*/