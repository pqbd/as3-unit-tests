// Unit test framework run configuration file
{
// Framework initialization
  import alx.common.test.*;
  // refactoring
  //CUnitTests.init( CTester, CTestLog, CUnitTests.SIMPLE_MODE, true);
  // development
  //CUnitTests.init( CTester, CTestLog, CUnitTests.EXTENDED_MODE, true);
  CUnitTests.init( CTester, CTestLog, CUnitTests.FULL_MODE, true);

// Run configuration
  import test.alx.common.test.CExampleTestCase;
  import test.alx.common.test.CExampleTestSuite;
  CUnitTests.run( CExampleTestCase
                , CExampleTestSuite
                );

// Green bar
  CUnitTests.printResult( root);
}      