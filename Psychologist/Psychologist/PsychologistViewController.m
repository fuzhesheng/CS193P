//
//  PsychologistViewController.m
//  Psychologist
//
//  Created by William Fu on 13/03/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PsychologistViewController.h"
#import "HappinessViewController.h"

@interface PsychologistViewController()
@property (nonatomic) int diagnosis;
@end

@implementation PsychologistViewController

@synthesize diagnosis = _diagnosis;

- (id <SplitViewBarButtonItemPresenter>)splitViewBarButtonItemPresenter
{
    id detailVC = [self.splitViewController.viewControllers lastObject];
    if (![detailVC conformsToProtocol:@protocol(SplitViewBarButtonItemPresenter)])
    {
        detailVC = nil;
    }
    return detailVC;
}

- (void)transferSplitViewBarButtonItemToViewController: (id)destinationViewController
{
    UIBarButtonItem *splitViewBarButtonItem = [[self splitViewBarButtonItemPresenter] splitViewBarButtonItem];
    [[self splitViewBarButtonItemPresenter] setSplitViewBarButtonItem:nil];
    if (splitViewBarButtonItem)
    {
        [destinationViewController setSplitViewBarButtonItem:splitViewBarButtonItem];
    }
}

- (HappinessViewController *)splitViewHappinessViewController
{
    id hvc = [self.splitViewController.viewControllers lastObject];
    if (![hvc isKindOfClass:[HappinessViewController class]])
    {
        hvc = nil;
    }
    return hvc;
}

- (void) setAndShowDiagnosis: (int) diagnosis
{
    self.diagnosis = diagnosis;
    if ([self splitViewHappinessViewController])
    {
        [self splitViewHappinessViewController].happiness = diagnosis;
    }
    else
    {
        [self performSegueWithIdentifier:@"ShowDiagnosis" sender:self];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowDiagnosis"])
    {
        [segue.destinationViewController setHappiness:self.diagnosis];
    }
    else if ([segue.identifier isEqualToString:@"Celebrity"])
    {
        [self transferSplitViewBarButtonItemToViewController:segue.destinationViewController];
        [segue.destinationViewController setHappiness:100];
    }
    else if ([segue.identifier isEqualToString:@"Serious"])
    {
        [self transferSplitViewBarButtonItemToViewController:segue.destinationViewController];
        [segue.destinationViewController setHappiness:20];
    }
    else if ([segue.identifier isEqualToString:@"TV Kook"])
    {
        [self transferSplitViewBarButtonItemToViewController:segue.destinationViewController];
        [segue.destinationViewController setHappiness:50];
    }
}

- (IBAction)flying {
    [self setAndShowDiagnosis:85];
}

- (IBAction)apple {
    [self setAndShowDiagnosis:100];
}

- (IBAction)dragons {
    [self setAndShowDiagnosis:20];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
