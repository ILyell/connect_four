Project DTR Template
Please make a copy to fill out with your partner/team


DTR: Define The Relationship
Your project has the potential to be amazing. The way you set expectations for communication, feedback, and working styles is critical to create an amazing product. We call this process DTR -- Define the Relationship. The more detailed and specific you can be at the start, the better your full instructional team will work together. 


Recommended Process
* DTR with your partner BEFORE you begin work
* Return to the DTR at the end of your first working session
* Return to your DTR any time you come into a team conflict


BEFORE YOU START THE PROJECT
DTR: Essential Questions to Discuss 
* What are your learning goals for the project?
   * I: See how compartmentalized things can be
   * I: Using recursion. Right way for these kinds of projects.
   * E: Effective scheduling and collaboration
   * E: Git workflow
* What are your strengths and areas of growth?
   * What do I offer the team?
      * I: Did simple game coding as a kid
      * E: Had similar experience years ago
         * Make sure it works, go back and fix
   * What learning do you want to focus on in the project?
      * See learning goals question above
   *  How can our team help support one anothers in improving these skills?
      * I: Hold Ethan accountable to Git workflow
      * E: Always ask “what does this do?” to keep classes small. 
* How do you learn best with coding? How do you like to collaborate with others?
   * I: Tend to like to work alone, speak out loud when learning
   * I: Feedback is always appreciated. Feel free to stop if pairing (especially typos)
      * Ian Receiving Feedback
         * Technical: never unwanted. Even if I disagree with the strategy, we can have an open discussion about the best way.
         * Don’t be a butt.
         * Be honest if there’s something we have a problem with
         * Communicating time: we will have a note folder, keep a spreadsheet or text file with times we want to meet up.
         * If changes, DM on Slack.
   * E: schedule calendar events
   * E: Also like to  figure things out alone first before coming to pair
      * Talk it out with someone else or in notes
      * Clearly defining what each of us does
      * Try pairing, even if it doesn’t come as naturally
      * Ethan Receiving Feedback
         * Always like to know why
      * WHEN:
         * Checking PRs: explain why, or comment in GitHub
      * HOW
         * Async: PR comments on Github
         * Talk out first what we're going to do before pairing
   * Have a meeting before merging any major PRs.
   * DMs on Slack that changes happened, specific changes commented in Github
   * Do you like to work alone first?
   * Do you like to speak out loud as you are learning?
   * What do you need (resources, environment, communication) to do your best work?
* How do you communicate best?
   * How do you appreciate receiving communication from others?
   * I: Slack DM
   * E: Slack DM, if super urgent text message (303)-513-2897, if quick, jump on a video Slack huddle
      *    * How do you appreciate receiving feedback from others?
   *    * How do you best give feedback to others?
   * I: Best feedback in a technical way. Good at giving specific feedback and answering why i’m giving whatever feedback it is.
   * E: Try to give a brief written statement, but jump on a video call for more specific.
* What scheduling restraints do you have?
   * I: No mornings preferred, Might be unavailable, Monday Noon/Afternoon,Will confirm by sunday.
      * Noon-5 is best
   * E: BUSY
      * 5/26: 
         * 6-7:15 PM
         *  
      * Friday, 5/27
         * Busy after 9pm MT
      * Saturday
         * Free morning-3pm MT, 4pm CT
 What are your scheduling preferences?
* What tools do you want to use to manage the project?
   * Slack
   * Google Calendar
   * Git Github
   * Notes folder: Keep tasks on MD file in Repo
   * RSPEC tests
      * Describe block for each method
      * Describe “#<method>” do
   * Git commits
      * TYPES: 
         * fix, 
         * feat, 
         * Test,
         * Refactor,
         * docs,  
      * test(Class): update #method
   * * How do you want the group to solve problems when members run into issues with features of the project?
   * Depends on what kinds of questions/problems
      * If it’s a concept we can’t grasp, pasting the code in slack
      * If it’s a concrete problem we can’t solve, jump on a huddle and talk it out.
   * ID the problem
   * Talk it out between the two of us before doing any drastic changes
* When will we check in again about our process and progress?
   * Tomorrow
* How do you know if a project is successful? 
   * If we can play connect four
   * Fail spectacularly, accidentally make Battleship
   * How can we achieve success as a group?
   * How can we achieve success as individuals?
* Is there anything else we should know about one another before we start working?








AFTER FIRST WEEK & ONGOING DURING PROJECT
DTR: Check In 
* Essential Questions:
   * Individual Reflection
      * Have I been able to uphold the DTR norms we set? 
      * Are there any new norms or expectations I would like to add?
      * Do I need to give any feedback or clarify my working relationship with anyone?
   * Team Discussion:
      * Have we been able to meet the DTR norms we set?
      * In what ways are we working well together?
      * Are there ways we should operate differently in order to be at our best as a team?
      * What do we commit to changing?
      * When will we check in again?


IF YOU HAVE A CONFLICT
DTR: Problem Solving
* Essential Questions:
   * Individual Reflection
      * What behaviors/actions are occurring that are causing a challenge?
      * Why are those behaviors challenging?  
      * Did we discuss those behaviors in our DTR? 
      * What language should I use to communicate this challenge?
   * Team Discussion:
      * Identify the problem/challenge that needs to be solved
      * What are the behaviors happening? 
      * How could we update our DTR to address this? 
      * What actions can we all take to move forward?


## Iteration 2 - Placing Pieces

### Test Driven Development
In this iteration, you are required to use TDD to create your classes. Use the interaction pattern to determine what a method should do and write one or more tests to verify that expected behavior. Then you can implement the method. You should always write code with the purpose of making a test pass.

### Placing Pieces
Update your program to request user input and allow them to place an individual piece.

Your program should ask the user to enter a letter A-G. Update the board to display the player’s piece in the lowest available position of the selected column with an ‘X’.

The computer takes its turn by selecting one of the 7 columns at random. Update the board to display the computer’s piece in the lowest available position of the selected column with an ‘O’.

The player and computer should be able to repeat this sequence and continue taking turns.

**Invalid Column Selection**

Neither the player nor computer should be able to play in an invalid column. An invalid column is defined as one of the following:

1. Outside the range A-G
1. Full, i.e. there is no available position in the column

If an invalid column is selected by the player, the program should display an error message and ask the player to select a valid column. The program should repeat this process until a valid column is selected.

* The one exception is when there are no valid columns available; i.e. the game board is full. In this case, the game is a draw, an endgame condition.

If an invalid column is selected by the computer, the program should repeat until a valid column is selected. No error message should display to the user when the computer selects an invalid column.