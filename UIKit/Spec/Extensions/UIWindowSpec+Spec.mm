#import "CDRSpecHelper.h"
#import "UIWindow+Spec.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(UIWindow_SpecSpec)

describe(@"UIWindow_Spec", ^{
    describe(@"finding the first responder", ^{
        __block UIWindow *window;
        __block UITextField *firstResponderGrandchild;

        beforeEach(^{
            window = [[[UIWindow alloc] init] autorelease];
            UITextField *child1 = [[[UITextField alloc] init] autorelease];
            UITextField *child2 = [[[UITextField alloc] init] autorelease];
            UITextField *grandchild1 = [[[UITextField alloc] init] autorelease];
            UITextField *grandchild2 = [[[UITextField alloc] init] autorelease];
            firstResponderGrandchild = [[[UITextField alloc] init] autorelease];

            [window addSubview:child1];
            [window addSubview:child2];
            [child1 addSubview:grandchild1];
            [child2 addSubview:grandchild2];
            [child2 addSubview:firstResponderGrandchild];
            [firstResponderGrandchild becomeFirstResponder] should be_truthy;
        });

        it(@"returns the first responder", ^{
            window.firstResponder should be_same_instance_as(firstResponderGrandchild);
        });
    });
});

SPEC_END
