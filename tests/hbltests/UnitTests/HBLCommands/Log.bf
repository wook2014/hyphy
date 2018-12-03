ExecuteAFile (PATH_TO_CURRENT_BF + "TestTools.ibf");
runATest ();


function getTestName ()
{
  return "Log";
}		


function runTest () {
	ASSERTION_BEHAVIOR = 1; /* print warning to console and go to the end of the execution list */
	testResult = 0;
  

  //---------------------------------------------------------------------------------------------------------
  // SIMPLE FUNCTIONALITY
  //---------------------------------------------------------------------------------------------------------
  // Natural logarithm of number.
  assert(Log(1) == 0, "Failed to compute the log of one");
  assert(Log(2.718281828459) > 0.9999999999, "Failed to compute the log of e (too low)");
  assert(Log(2.718281828459) < 1.0000000001, "Failed to compute the log of e (too high)");
  // Adler-32 checksum of a string.
  assert(Log("hyphy"), 109707827, "Failed to compute the Log (Adler-32 checksum) of a string");
  // Natural logarithm of array.
  assert(Log({{1,2}{3,4}}) == {{0,0.6931471805599453}{1.09861228866811,1.386294361119891}}, "Failed to compute the log of an array");

  //---------------------------------------------------------------------------------------------------------
  // ERROR HANDLING
  //---------------------------------------------------------------------------------------------------------
  Topology T = ((1,2),(3,4),5);
  Tree TT = ((1,2),(3,4),5);

  assert (runCommandWithSoftErrors ('Log (None,0)', "Unconsumed values on the stack"), "Failed error checking for trying to take a maximum with None");
  assert (runCommandWithSoftErrors ('Log (T)', "not implemented/defined for a Topology"), "Failed error checking for trying to take the Log of a topology");
  assert (runCommandWithSoftErrors ('Log (TT)', "not implemented/defined for a Tree"), "Failed error checking for trying to take the Log of a tree");
  assert (runCommandWithSoftErrors ('Log (1,2)',  "Unconsumed values on the stack"), "Too many arguments error check");
 

  testResult = 1;

	return testResult;
}
