//
//  NMLViewController.m
//  TextKitIntro
//
//  Created by Ben Lachman on 2/19/14.
//  Copyright (c) 2014 Ben Lachman. All rights reserved.
//

#import "NMLViewController.h"
#import "NMLLayoutManager.h"


@implementation NMLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Setup the view hierarchy
	NMLLayoutManager *layoutManager = [[NMLLayoutManager alloc] init];
//
	NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(500, 500)];
	textContainer.heightTracksTextView = YES;
	textContainer.widthTracksTextView = YES;
//
//	// Open an RTF file to use as content.
	NSURL *rtfFileURL = [[NSBundle mainBundle] URLForResource:@"It's My Own Invention" withExtension:@"rtf"];
	NSError *textOpenError = nil;

	NSTextStorage *textStorage = [[NSTextStorage alloc] initWithFileURL:rtfFileURL options:nil documentAttributes:nil error:&textOpenError];

	layoutManager.textStorage = textStorage;
	[layoutManager addTextContainer:textContainer];
//
	UITextView *customBuiltTextView = ({
		UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 50, 320, 740) textContainer:textContainer];
		textView.textContainerInset = UIEdgeInsetsMake(20, 50, 20, 50);

		textView;
	});
	
	self.firstColumnTextView = customBuiltTextView;
	
	[self.view addSubview:customBuiltTextView];
}


- (IBAction)addColumn:(id)sender {
	UITextView *customBuiltTextView = ({
		NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(500, 500)];
		textContainer.heightTracksTextView = YES;
		textContainer.widthTracksTextView = YES;
		
		UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(400, 50, 320, 740) textContainer:textContainer];
		textView.textContainerInset = UIEdgeInsetsMake(20, 50, 20, 50);
		
		textView;
	});
	
	self.secondColumnTextView = customBuiltTextView;
	
	[self.firstColumnTextView.layoutManager addTextContainer:self.secondColumnTextView.textContainer];
	
	[self.view addSubview:self.secondColumnTextView];
}

- (IBAction)showHTML:(id)sender {
 	NSString *htmlString = @"<HTML><HEAD></HEAD><BODY LANG='en-US' DIR='LTR' STYLE='border: none; padding: 0in'><P STYLE='margin-bottom: 0in'><FONT SIZE=9>'You are sad,' the Knightsaid in an anxious tone: 'let me sing you a song to comfort you.'</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'Is it very long?' Aliceasked, for she had heard a good deal of poetry that day.</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'It's long,' said theKnight, 'but it's very, </FONT><FONT SIZE=6><I>very</I></FONT><FONT SIZE=6>beautiful. Everybody that hears me sing it -- either it brings the</FONT><FONT SIZE=6><I>tears</I></FONT><FONT SIZE=6> into their eyes,or else --'</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'Or else what?' saidAlice, for the Knight had made a sudden pause.</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'Or else it doesn't, youknow. The name of the song is called &quot;</FONT><FONT SIZE=6><I>Haddocks'Eyes</I></FONT><FONT SIZE=6>&quot;.'</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'Oh, that's the name ofthe song, is it?' Alice said, trying to feel interested.</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'No, you don'tunderstand,' the Knight said, looking a little vexed. 'That's whatthe name is </FONT><FONT SIZE=6><I>called</I></FONT><FONT SIZE=6>.The name really </FONT><FONT SIZE=6><I>is &quot;The Aged Aged Man&quot;</I></FONT><FONT SIZE=6>.'</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'Then I ought to have said&quot;That's what the </FONT><FONT SIZE=6><I>song</I></FONT><FONT SIZE=6>is called&quot;?' Alice corrected herself.</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'No, you oughtn't: that'squite another thing! The </FONT><FONT SIZE=6><I>song</I></FONT><FONT SIZE=6>is called &quot;</FONT><FONT SIZE=6><I>Ways and Means</I></FONT><FONT SIZE=6>&quot;:but that's only what it's </FONT><FONT SIZE=6><I>called</I></FONT><FONT SIZE=6>,you know!'</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'Well, what </FONT><FONT SIZE=6><I>is</I></FONT><FONT SIZE=6>the song, then?' said Alice, who was by this time completelybewildered.</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>'I was coming to that,'the Knight said. 'The song really </FONT><FONT SIZE=6><I>is&quot;A-sitting On a Gate&quot;</I></FONT><FONT SIZE=6>: and thetune's my own invention.'</FONT></P><P STYLE='margin-bottom: 0in'><FONT SIZE=6>So saying, he stopped hishorse and let the reins fall on its neck: then, slowly beating timewith one hand, and with a faint smile lighting up his gentle foolishface, as if he enjoyed the music of his song, he began.</FONT></P><P STYLE='margin-bottom: 0in'><BR></P><P STYLE='margin-bottom: 0in'>&mdash; <FONT SIZE=6>Excerpt from</FONT><FONT SIZE=6><I>Through the Looking Glass, </I></FONT><FONT SIZE=6>Ch8. It's My Own Invention</FONT><FONT SIZE=6><I>, </I></FONT><FONT SIZE=6>byLewis Carroll</FONT></P></BODY></HTML>";
	
	NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
	
	[self.firstColumnTextView.layoutManager invalidateDisplayForCharacterRange:NSMakeRange(0, self.firstColumnTextView.textStorage.length)];

	self.firstColumnTextView.textStorage.attributedString = attributedString;	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
