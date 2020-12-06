#pollsa

pollsapi on rxapi but this time (really!) 
starting from scratch

# pitfalls
You will asked to run the dev server runserver, and the defaultport is 8000
but it only serves to the local machine. SO if you're connecting remotely (i.e. installing on a remote mach)
then it won't work. 

It took a while to solve this. I finally got it at rev ef4db20
(the rev previous to this) because it was
./manage.py runserver 0.0.0.0:8000

(I had tried the machs internet address: that failed miserably. I also tried redicrecting to 80 .. but youcan't
serve on that as normal user. I fell into thinking that I would not be able to access a page into a normaluser's
folder. I was sure that was it but the above runserver line actually worked, so that was a blidn alley).

Note 8000 is not https, only http. Naturally.

A this stage, (ef4db20, and followin grev) does admin work? Yes, you need to createsuperuser from ./manage.py
and this will let you in. It only has groups and users. Very bare.

I applied migrate afetr this, but nothing happened. I suppose the manage,py operated directly on DB, so no migrations.

At this point it has an irritating "set up the admin" but annoyingly the github shows that "admin.py" in 
the app folder is where this goes. So it's not the rpkject admin then, right? It's the apps admin. OH well need to follow.
It's not really tested either. And the VOte model doesn't go in.

OK, it now appears that an admin.py is created in the polls app. right so I fill it in according to above. git commit this
and then try the admin site again

OK, so I see now (at rev b6a685a) that the admin;py file worked! The admin site used to only have author and authent, not i
has a special section named after the app (polls)!  Nothing really in it, but admin site knows about them, great!


Beware writing a file which has an extension the same as the basename os anther file.
I.e. polls.urls .. that actaully refers to polls/urls.py , not a file that you should create acalleed polls.urls!

OK.. reach ed the point just before using DRF, I went into admin and was able to put in a polls.question
and choices, all from the admin both on local host and remotely. However I authenticated as admin user "ubuntu"
so you woul dnot be able to post otherwise would you? Answer, as expected, yo get an error. Only reading possible
unless, as I say, you authenticate via admin panel.

After this we start with thhe DRF by merely putting in a "serializer.py" file int he app folder
it will import serializer from DRF and we can create classes on the ModelSerializer from that unit.
e can then use ./amange.py shell to put in a poll in json format, without authenticating actually,
just using manage,shell

At rev 442a8e4 stage, we can see fill raw json when we visit the polls, but polls/1 doesn't work.

Anyhow speed on to APIview, which is the nice web view of the api. Actually we jump the views.py, now using apiviews
which makes sense, this is an api site.
