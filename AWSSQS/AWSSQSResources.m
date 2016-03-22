//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSSQSResources.h"
#import "AWSLogging.h"

@interface AWSSQSResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSQSResources

+ (instancetype)sharedInstance {
    static AWSSQSResources *_sharedResources = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSQSResources new];
    });
    
    return _sharedResources;
}
- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @" \
    { \
      \"version\":\"2.0\", \
      \"metadata\":{ \
        \"apiVersion\":\"2012-11-05\", \
        \"endpointPrefix\":\"sqs\", \
        \"serviceAbbreviation\":\"Amazon SQS\", \
        \"serviceFullName\":\"Amazon Simple Queue Service\", \
        \"signatureVersion\":\"v4\", \
        \"xmlNamespace\":\"http://queue.amazonaws.com/doc/2012-11-05/\", \
        \"protocol\":\"query\" \
      }, \
      \"documentation\":\"<p>Welcome to the <i>Amazon Simple Queue Service API Reference</i>. This section describes who should read this guide, how the guide is organized, and other resources related to the Amazon Simple Queue Service (Amazon SQS).</p> <p>Amazon SQS offers reliable and scalable hosted queues for storing messages as they travel between computers. By using Amazon SQS, you can move data between distributed components of your applications that perform different tasks without losing messages or requiring each component to be always available.</p> <p>Helpful Links: <ul> <li><a href=\\\"http://queue.amazonaws.com/doc/2012-11-05/QueueService.wsdl\\\">Current WSDL (2012-11-05)</a></li> <li><a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/MakingRequestsArticle.html\\\">Making API Requests</a></li> <li><a href=\\\"http://aws.amazon.com/sqs/\\\">Amazon SQS product page</a></li> <li><a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSDeadLetterQueue.html\\\">Using Amazon SQS Dead Letter Queues</a></li> <li><a href=\\\"http://docs.aws.amazon.com/general/latest/gr/rande.html#sqs_region\\\">Regions and Endpoints</a></li> </ul> </p> <p>We also provide SDKs that enable you to access Amazon SQS from your preferred programming language. The SDKs contain functionality that automatically takes care of tasks such as:</p> <p> <ul> <li>Cryptographically signing your service requests</li> <li>Retrying requests</li> <li>Handling error responses</li> </ul> </p> <p>For a list of available SDKs, go to <a href=\\\"http://aws.amazon.com/tools/\\\">Tools for Amazon Web Services</a>.</p>\", \
      \"operations\":{ \
        \"AddPermission\":{ \
          \"name\":\"AddPermission\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"AddPermissionRequest\"}, \
          \"errors\":[ \
            { \
              \"shape\":\"OverLimit\", \
              \"error\":{ \
                \"code\":\"OverLimit\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The action that you requested would violate a limit. For example, ReceiveMessage returns this error if the maximum number of messages inflight has already been reached. <a>AddPermission</a> returns this error if the maximum number of permissions for the queue has already been reached. </p>\" \
            } \
          ], \
          \"documentation\":\"<p>Adds a permission to a queue for a specific <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P\\\">principal</a>. This allows for sharing access to the queue.</p> <p>When you create a queue, you have full control access rights for the queue. Only you (as owner of the queue) can grant or deny permissions to the queue. For more information about these permissions, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/acp-overview.html\\\">Shared Queues</a> in the <i>Amazon SQS Developer Guide</i>.</p> <note> <p><code>AddPermission</code> writes an Amazon SQS-generated policy. If you want to write your own policy, use <a>SetQueueAttributes</a> to upload your policy. For more information about writing your own policy, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AccessPolicyLanguage.html\\\">Using The Access Policy Language</a> in the <i>Amazon SQS Developer Guide</i>.</p> </note> <note>Some API actions take lists of parameters. These lists are specified using the <code>param.n</code> notation. Values of <code>n</code> are integers starting from 1. For example, a parameter list with two elements looks like this: </note> <p><code>&amp;Attribute.1=this</code></p> <p><code>&amp;Attribute.2=that</code></p>\" \
        }, \
        \"ChangeMessageVisibility\":{ \
          \"name\":\"ChangeMessageVisibility\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"ChangeMessageVisibilityRequest\"}, \
          \"errors\":[ \
            { \
              \"shape\":\"MessageNotInflight\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.MessageNotInflight\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The message referred to is not in flight.</p>\" \
            }, \
            { \
              \"shape\":\"ReceiptHandleIsInvalid\", \
              \"exception\":true, \
              \"documentation\":\"<p>The receipt handle provided is not valid.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Changes the visibility timeout of a specified message in a queue to a new value. The maximum allowed timeout value you can set the value to is 12 hours. This means you can't extend the timeout of a message in an existing queue to more than a total visibility timeout of 12 hours. (For more information visibility timeout, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html\\\">Visibility Timeout</a> in the <i>Amazon SQS Developer Guide</i>.)</p> <p>For example, let's say you have a message and its default message visibility timeout is 30 minutes. You could call <code>ChangeMessageVisiblity</code> with a value of two hours and the effective timeout would be two hours and 30 minutes. When that time comes near you could again extend the time out by calling ChangeMessageVisiblity, but this time the maximum allowed timeout would be 9 hours and 30 minutes.</p> <note><p>There is a 120,000 limit for the number of inflight messages per queue. Messages are inflight after they have been received from the queue by a consuming component, but have not yet been deleted from the queue. If you reach the 120,000 limit, you will receive an OverLimit error message from Amazon SQS. To help avoid reaching the limit, you should delete the messages from the queue after they have been processed. You can also increase the number of queues you use to process the messages. </p></note> <important>If you attempt to set the <code>VisibilityTimeout</code> to an amount more than the maximum time left, Amazon SQS returns an error. It will not automatically recalculate and increase the timeout to the maximum time remaining.</important> <important>Unlike with a queue, when you change the visibility timeout for a specific message, that timeout value is applied immediately but is not saved in memory for that message. If you don't delete a message after it is received, the visibility timeout for the message the next time it is received reverts to the original timeout value, not the value you set with the <code>ChangeMessageVisibility</code> action.</important>\" \
        }, \
        \"ChangeMessageVisibilityBatch\":{ \
          \"name\":\"ChangeMessageVisibilityBatch\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"ChangeMessageVisibilityBatchRequest\"}, \
          \"output\":{ \
            \"shape\":\"ChangeMessageVisibilityBatchResult\", \
            \"documentation\":\"<p> For each message in the batch, the response contains a <a>ChangeMessageVisibilityBatchResultEntry</a> tag if the message succeeds or a <a>BatchResultErrorEntry</a> tag if the message fails. </p>\", \
            \"resultWrapper\":\"ChangeMessageVisibilityBatchResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"TooManyEntriesInBatchRequest\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.TooManyEntriesInBatchRequest\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Batch request contains more number of entries than permissible.</p>\" \
            }, \
            { \
              \"shape\":\"EmptyBatchRequest\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.EmptyBatchRequest\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Batch request does not contain an entry.</p>\" \
            }, \
            { \
              \"shape\":\"BatchEntryIdsNotDistinct\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.BatchEntryIdsNotDistinct\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Two or more batch entries have the same <code>Id</code> in the request.</p>\" \
            }, \
            { \
              \"shape\":\"InvalidBatchEntryId\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.InvalidBatchEntryId\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The <code>Id</code> of a batch entry in a batch request does not abide by the specification.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Changes the visibility timeout of multiple messages. This is a batch version of <a>ChangeMessageVisibility</a>. The result of the action on each message is reported individually in the response. You can send up to 10 <a>ChangeMessageVisibility</a> requests with each <code>ChangeMessageVisibilityBatch</code> action.</p> <important>Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of 200.</important> <note>Some API actions take lists of parameters. These lists are specified using the <code>param.n</code> notation. Values of <code>n</code> are integers starting from 1. For example, a parameter list with two elements looks like this: </note> <p><code>&amp;Attribute.1=this</code></p> <p><code>&amp;Attribute.2=that</code></p>\" \
        }, \
        \"CreateQueue\":{ \
          \"name\":\"CreateQueue\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"CreateQueueRequest\"}, \
          \"output\":{ \
            \"shape\":\"CreateQueueResult\", \
            \"documentation\":\"<p>Returns the QueueUrl element of the created queue.</p>\", \
            \"resultWrapper\":\"CreateQueueResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"QueueDeletedRecently\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.QueueDeletedRecently\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>You must wait 60 seconds after deleting a queue before you can create another with the same name.</p>\" \
            }, \
            { \
              \"shape\":\"QueueNameExists\", \
              \"error\":{ \
                \"code\":\"QueueAlreadyExists\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>A queue already exists with this name. Amazon SQS returns this error only if the request includes attributes whose values differ from those of the existing queue.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Creates a new queue, or returns the URL of an existing one. When you request <code>CreateQueue</code>, you provide a name for the queue. To successfully create a new queue, you must provide a name that is unique within the scope of your own queues.</p> <note> <p>If you delete a queue, you must wait at least 60 seconds before creating a queue with the same name.</p> </note> <p>You may pass one or more attributes in the request. If you do not provide a value for any attribute, the queue will have the default value for that attribute. Permitted attributes are the same that can be set using <a>SetQueueAttributes</a>.</p> <note><p>Use <a>GetQueueUrl</a> to get a queue's URL. <a>GetQueueUrl</a> requires only the <code>QueueName</code> parameter.</p></note> <p>If you provide the name of an existing queue, along with the exact names and values of all the queue's attributes, <code>CreateQueue</code> returns the queue URL for the existing queue. If the queue name, attribute names, or attribute values do not match an existing queue, <code>CreateQueue</code> returns an error.</p> <note>Some API actions take lists of parameters. These lists are specified using the <code>param.n</code> notation. Values of <code>n</code> are integers starting from 1. For example, a parameter list with two elements looks like this: </note> <p><code>&amp;Attribute.1=this</code></p> <p><code>&amp;Attribute.2=that</code></p>\" \
        }, \
        \"DeleteMessage\":{ \
          \"name\":\"DeleteMessage\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"DeleteMessageRequest\"}, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidIdFormat\", \
              \"exception\":true, \
              \"documentation\":\"<p>The receipt handle is not valid for the current version.</p>\" \
            }, \
            { \
              \"shape\":\"ReceiptHandleIsInvalid\", \
              \"exception\":true, \
              \"documentation\":\"<p>The receipt handle provided is not valid.</p>\" \
            } \
          ], \
          \"documentation\":\"<p> Deletes the specified message from the specified queue. You specify the message by using the message's <code>receipt handle</code> and not the <code>message ID</code> you received when you sent the message. Even if the message is locked by another reader due to the visibility timeout setting, it is still deleted from the queue. If you leave a message in the queue for longer than the queue's configured retention period, Amazon SQS automatically deletes it. </p> <note> <p> The receipt handle is associated with a specific instance of receiving the message. If you receive a message more than once, the receipt handle you get each time you receive the message is different. When you request <code>DeleteMessage</code>, if you don't provide the most recently received receipt handle for the message, the request will still succeed, but the message might not be deleted. </p> </note> <important> <p> It is possible you will receive a message even after you have deleted it. This might happen on rare occasions if one of the servers storing a copy of the message is unavailable when you request to delete the message. The copy remains on the server and might be returned to you again on a subsequent receive request. You should create your system to be idempotent so that receiving a particular message more than once is not a problem. </p> </important>\" \
        }, \
        \"DeleteMessageBatch\":{ \
          \"name\":\"DeleteMessageBatch\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"DeleteMessageBatchRequest\"}, \
          \"output\":{ \
            \"shape\":\"DeleteMessageBatchResult\", \
            \"documentation\":\"<p> For each message in the batch, the response contains a <a>DeleteMessageBatchResultEntry</a> tag if the message is deleted or a <a>BatchResultErrorEntry</a> tag if the message cannot be deleted. </p>\", \
            \"resultWrapper\":\"DeleteMessageBatchResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"TooManyEntriesInBatchRequest\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.TooManyEntriesInBatchRequest\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Batch request contains more number of entries than permissible.</p>\" \
            }, \
            { \
              \"shape\":\"EmptyBatchRequest\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.EmptyBatchRequest\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Batch request does not contain an entry.</p>\" \
            }, \
            { \
              \"shape\":\"BatchEntryIdsNotDistinct\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.BatchEntryIdsNotDistinct\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Two or more batch entries have the same <code>Id</code> in the request.</p>\" \
            }, \
            { \
              \"shape\":\"InvalidBatchEntryId\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.InvalidBatchEntryId\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The <code>Id</code> of a batch entry in a batch request does not abide by the specification.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Deletes multiple messages. This is a batch version of <a>DeleteMessage</a>. The result of the delete action on each message is reported individually in the response.</p> <important> <p> Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of 200. </p> </important> <note>Some API actions take lists of parameters. These lists are specified using the <code>param.n</code> notation. Values of <code>n</code> are integers starting from 1. For example, a parameter list with two elements looks like this: </note> <p><code>&amp;Attribute.1=this</code></p> <p><code>&amp;Attribute.2=that</code></p>\" \
        }, \
        \"DeleteQueue\":{ \
          \"name\":\"DeleteQueue\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"DeleteQueueRequest\"}, \
          \"documentation\":\"<p> Deletes the queue specified by the <b>queue URL</b>, regardless of whether the queue is empty. If the specified queue does not exist, Amazon SQS returns a successful response. </p> <important> <p> Use <code>DeleteQueue</code> with care; once you delete your queue, any messages in the queue are no longer available. </p> </important> <p> When you delete a queue, the deletion process takes up to 60 seconds. Requests you send involving that queue during the 60 seconds might succeed. For example, a <a>SendMessage</a> request might succeed, but after the 60 seconds, the queue and that message you sent no longer exist. Also, when you delete a queue, you must wait at least 60 seconds before creating a queue with the same name. </p> <p> We reserve the right to delete queues that have had no activity for more than 30 days. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSConcepts.html\\\">How Amazon SQS Queues Work</a> in the <i>Amazon SQS Developer Guide</i>. </p>\" \
        }, \
        \"GetQueueAttributes\":{ \
          \"name\":\"GetQueueAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"GetQueueAttributesRequest\"}, \
          \"output\":{ \
            \"shape\":\"GetQueueAttributesResult\", \
            \"documentation\":\"A list of returned queue attributes.\", \
            \"resultWrapper\":\"GetQueueAttributesResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidAttributeName\", \
              \"exception\":true, \
              \"documentation\":\"<p>The attribute referred to does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Gets attributes for the specified queue. The following attributes are supported: <ul> <li> <code>All</code> - returns all values.</li> <li> <code>ApproximateNumberOfMessages</code> - returns the approximate number of visible messages in a queue. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/ApproximateNumber.html\\\">Resources Required to Process Messages</a> in the <i>Amazon SQS Developer Guide</i>.</li> <li> <code>ApproximateNumberOfMessagesNotVisible</code> - returns the approximate number of messages that are not timed-out and not deleted. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/ApproximateNumber.html\\\">Resources Required to Process Messages</a> in the <i>Amazon SQS Developer Guide</i>.</li> <li> <code>VisibilityTimeout</code> - returns the visibility timeout for the queue. For more information about visibility timeout, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html\\\">Visibility Timeout</a> in the <i>Amazon SQS Developer Guide</i>.</li> <li> <code>CreatedTimestamp</code> - returns the time when the queue was created (epoch time in seconds).</li> <li> <code>LastModifiedTimestamp</code> - returns the time when the queue was last changed (epoch time in seconds).</li> <li> <code>Policy</code> - returns the queue's policy.</li> <li> <code>MaximumMessageSize</code> - returns the limit of how many bytes a message can contain before Amazon SQS rejects it.</li> <li> <code>MessageRetentionPeriod</code> - returns the number of seconds Amazon SQS retains a message.</li> <li> <code>QueueArn</code> - returns the queue's Amazon resource name (ARN).</li> <li> <code>ApproximateNumberOfMessagesDelayed</code> - returns the approximate number of messages that are pending to be added to the queue.</li> <li> <code>DelaySeconds</code> - returns the default delay on the queue in seconds.</li> <li> <code>ReceiveMessageWaitTimeSeconds</code> - returns the time for which a ReceiveMessage call will wait for a message to arrive.</li> <li> <code>RedrivePolicy</code> - returns the parameters for dead letter queue functionality of the source queue. For more information about RedrivePolicy and dead letter queues, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSDeadLetterQueue.html\\\">Using Amazon SQS Dead Letter Queues</a> in the <i>Amazon SQS Developer Guide</i>.</li> </ul> </p> <note>Going forward, new attributes might be added. If you are writing code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.</note> <note>Some API actions take lists of parameters. These lists are specified using the <code>param.n</code> notation. Values of <code>n</code> are integers starting from 1. For example, a parameter list with two elements looks like this: </note> <p><code>&amp;Attribute.1=this</code></p> <p><code>&amp;Attribute.2=that</code></p>\" \
        }, \
        \"GetQueueUrl\":{ \
          \"name\":\"GetQueueUrl\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"GetQueueUrlRequest\"}, \
          \"output\":{ \
            \"shape\":\"GetQueueUrlResult\", \
            \"documentation\":\"<p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/UnderstandingResponses.html\\\">Responses</a> in the <i>Amazon SQS Developer Guide</i>.</p>\", \
            \"resultWrapper\":\"GetQueueUrlResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"QueueDoesNotExist\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.NonExistentQueue\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The queue referred to does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p> Returns the URL of an existing queue. This action provides a simple way to retrieve the URL of an Amazon SQS queue. </p> <p> To access a queue that belongs to another AWS account, use the <code>QueueOwnerAWSAccountId</code> parameter to specify the account ID of the queue's owner. The queue's owner must grant you permission to access the queue. For more information about shared queue access, see <a>AddPermission</a> or go to <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/acp-overview.html\\\">Shared Queues</a> in the <i>Amazon SQS Developer Guide</i>. </p>\" \
        }, \
        \"ListDeadLetterSourceQueues\":{ \
          \"name\":\"ListDeadLetterSourceQueues\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"ListDeadLetterSourceQueuesRequest\"}, \
          \"output\":{ \
            \"shape\":\"ListDeadLetterSourceQueuesResult\", \
            \"documentation\":\"A list of your dead letter source queues.\", \
            \"resultWrapper\":\"ListDeadLetterSourceQueuesResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"QueueDoesNotExist\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.NonExistentQueue\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The queue referred to does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Returns a list of your queues that have the RedrivePolicy queue attribute configured with a dead letter queue.</p> <p>For more information about using dead letter queues, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSDeadLetterQueue.html\\\">Using Amazon SQS Dead Letter Queues</a>.</p>\" \
        }, \
        \"ListQueues\":{ \
          \"name\":\"ListQueues\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"ListQueuesRequest\"}, \
          \"output\":{ \
            \"shape\":\"ListQueuesResult\", \
            \"documentation\":\"A list of your queues.\", \
            \"resultWrapper\":\"ListQueuesResult\" \
          }, \
          \"documentation\":\"<p>Returns a list of your queues. The maximum number of queues that can be returned is 1000. If you specify a value for the optional <code>QueueNamePrefix</code> parameter, only queues with a name beginning with the specified value are returned.</p>\" \
        }, \
        \"ReceiveMessage\":{ \
          \"name\":\"ReceiveMessage\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"ReceiveMessageRequest\"}, \
          \"output\":{ \
            \"shape\":\"ReceiveMessageResult\", \
            \"documentation\":\"A list of received messages.\", \
            \"resultWrapper\":\"ReceiveMessageResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"OverLimit\", \
              \"error\":{ \
                \"code\":\"OverLimit\", \
                \"httpStatusCode\":403, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The action that you requested would violate a limit. For example, ReceiveMessage returns this error if the maximum number of messages inflight has already been reached. <a>AddPermission</a> returns this error if the maximum number of permissions for the queue has already been reached. </p>\" \
            } \
          ], \
          \"documentation\":\"<p> Retrieves one or more messages, with a maximum limit of 10 messages, from the specified queue. Long poll support is enabled by using the <code>WaitTimeSeconds</code> parameter. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html\\\">Amazon SQS Long Poll</a> in the <i>Amazon SQS Developer Guide</i>. </p> <p> Short poll is the default behavior where a weighted random set of machines is sampled on a <code>ReceiveMessage</code> call. This means only the messages on the sampled machines are returned. If the number of messages in the queue is small (less than 1000), it is likely you will get fewer messages than you requested per <code>ReceiveMessage</code> call. If the number of messages in the queue is extremely small, you might not receive any messages in a particular <code>ReceiveMessage</code> response; in which case you should repeat the request. </p> <p> For each message returned, the response includes the following: </p> <ul> <li> <p> Message body </p> </li> <li> <p> MD5 digest of the message body. For information about MD5, go to <a href=\\\"http://www.faqs.org/rfcs/rfc1321.html\\\">http://www.faqs.org/rfcs/rfc1321.html</a>. </p> </li> <li> <p> Message ID you received when you sent the message to the queue. </p> </li> <li> <p> Receipt handle. </p> </li> <li> <p> Message attributes. </p> </li> <li> <p> MD5 digest of the message attributes. </p> </li> </ul> <p> The receipt handle is the identifier you must provide when deleting the message. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/ImportantIdentifiers.html\\\">Queue and Message Identifiers</a> in the <i>Amazon SQS Developer Guide</i>. </p> <p> You can provide the <code>VisibilityTimeout</code> parameter in your request, which will be applied to the messages that Amazon SQS returns in the response. If you do not include the parameter, the overall visibility timeout for the queue is used for the returned messages. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html\\\">Visibility Timeout</a> in the <i>Amazon SQS Developer Guide</i>. </p> <note> <p> Going forward, new attributes might be added. If you are writing code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully. </p> </note>\" \
        }, \
        \"RemovePermission\":{ \
          \"name\":\"RemovePermission\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"RemovePermissionRequest\"}, \
          \"documentation\":\"<p>Revokes any permissions in the queue policy that matches the specified <code>Label</code> parameter. Only the owner of the queue can remove permissions.</p>\" \
        }, \
        \"SendMessage\":{ \
          \"name\":\"SendMessage\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"SendMessageRequest\"}, \
          \"output\":{ \
            \"shape\":\"SendMessageResult\", \
            \"documentation\":\"<p>The MD5OfMessageBody and MessageId elements.</p>\", \
            \"resultWrapper\":\"SendMessageResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidMessageContents\", \
              \"exception\":true, \
              \"documentation\":\"<p>The message contains characters outside the allowed set.</p>\" \
            }, \
            { \
              \"shape\":\"UnsupportedOperation\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.UnsupportedOperation\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Error code 400. Unsupported operation.</p>\" \
            } \
          ], \
          \"documentation\":\"<p> Delivers a message to the specified queue. With Amazon SQS, you now have the ability to send large payload messages that are up to 256KB (262,144 bytes) in size. To send large payloads, you must use an AWS SDK that supports SigV4 signing. To verify whether SigV4 is supported for an AWS SDK, check the SDK release notes. </p> <important> <p> The following list shows the characters (in Unicode) allowed in your message, according to the W3C XML specification. For more information, go to <a href=\\\"http://www.w3.org/TR/REC-xml/#charsets\\\">http://www.w3.org/TR/REC-xml/#charsets</a> If you send any characters not included in the list, your request will be rejected. </p> <p> #x9 | #xA | #xD | [#x20 to #xD7FF] | [#xE000 to #xFFFD] | [#x10000 to #x10FFFF] </p> </important>\" \
        }, \
        \"SendMessageBatch\":{ \
          \"name\":\"SendMessageBatch\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"SendMessageBatchRequest\"}, \
          \"output\":{ \
            \"shape\":\"SendMessageBatchResult\", \
            \"documentation\":\"<p>For each message in the batch, the response contains a <a>SendMessageBatchResultEntry</a> tag if the message succeeds or a <a>BatchResultErrorEntry</a> tag if the message fails.</p>\", \
            \"resultWrapper\":\"SendMessageBatchResult\" \
          }, \
          \"errors\":[ \
            { \
              \"shape\":\"TooManyEntriesInBatchRequest\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.TooManyEntriesInBatchRequest\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Batch request contains more number of entries than permissible.</p>\" \
            }, \
            { \
              \"shape\":\"EmptyBatchRequest\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.EmptyBatchRequest\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Batch request does not contain an entry.</p>\" \
            }, \
            { \
              \"shape\":\"BatchEntryIdsNotDistinct\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.BatchEntryIdsNotDistinct\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Two or more batch entries have the same <code>Id</code> in the request.</p>\" \
            }, \
            { \
              \"shape\":\"BatchRequestTooLong\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.BatchRequestTooLong\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The length of all the messages put together is more than the limit.</p>\" \
            }, \
            { \
              \"shape\":\"InvalidBatchEntryId\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.InvalidBatchEntryId\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>The <code>Id</code> of a batch entry in a batch request does not abide by the specification.</p>\" \
            }, \
            { \
              \"shape\":\"UnsupportedOperation\", \
              \"error\":{ \
                \"code\":\"AWS.SimpleQueueService.UnsupportedOperation\", \
                \"httpStatusCode\":400, \
                \"senderFault\":true \
              }, \
              \"exception\":true, \
              \"documentation\":\"<p>Error code 400. Unsupported operation.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Delivers up to ten messages to the specified queue. This is a batch version of <a>SendMessage</a>. The result of the send action on each message is reported individually in the response. The maximum allowed individual message size is 256 KB (262,144 bytes).</p> <p>The maximum total payload size (i.e., the sum of all a batch's individual message lengths) is also 256 KB (262,144 bytes).</p> <p>If the <code>DelaySeconds</code> parameter is not specified for an entry, the default for the queue is used.</p> <important>The following list shows the characters (in Unicode) that are allowed in your message, according to the W3C XML specification. For more information, go to <a href=\\\"http://www.faqs.org/rfcs/rfc1321.html\\\">http://www.faqs.org/rfcs/rfc1321.html</a>. If you send any characters that are not included in the list, your request will be rejected. <p>#x9 | #xA | #xD | [#x20 to #xD7FF] | [#xE000 to #xFFFD] | [#x10000 to #x10FFFF]</p> </important> <important> Because the batch request can result in a combination of successful and unsuccessful actions, you should check for batch errors even when the call returns an HTTP status code of 200. </important> <note>Some API actions take lists of parameters. These lists are specified using the <code>param.n</code> notation. Values of <code>n</code> are integers starting from 1. For example, a parameter list with two elements looks like this: </note> <p><code>&amp;Attribute.1=this</code></p> <p><code>&amp;Attribute.2=that</code></p>\" \
        }, \
        \"SetQueueAttributes\":{ \
          \"name\":\"SetQueueAttributes\", \
          \"http\":{ \
            \"method\":\"POST\", \
            \"requestUri\":\"/\" \
          }, \
          \"input\":{\"shape\":\"SetQueueAttributesRequest\"}, \
          \"errors\":[ \
            { \
              \"shape\":\"InvalidAttributeName\", \
              \"exception\":true, \
              \"documentation\":\"<p>The attribute referred to does not exist.</p>\" \
            } \
          ], \
          \"documentation\":\"<p>Sets the value of one or more queue attributes. When you change a queue's attributes, the change can take up to 60 seconds for most of the attributes to propagate throughout the SQS system. Changes made to the <code>MessageRetentionPeriod</code> attribute can take up to 15 minutes.</p> <note>Going forward, new attributes might be added. If you are writing code that calls this action, we recommend that you structure your code so that it can handle new attributes gracefully.</note>\" \
        } \
      }, \
      \"shapes\":{ \
        \"AWSAccountIdList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"String\", \
            \"locationName\":\"AWSAccountId\" \
          }, \
          \"flattened\":true \
        }, \
        \"ActionNameList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"String\", \
            \"locationName\":\"ActionName\" \
          }, \
          \"flattened\":true \
        }, \
        \"AddPermissionRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"Label\", \
            \"AWSAccountIds\", \
            \"Actions\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"Label\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The unique identification of the permission you're setting (e.g., <code>AliceSendMessage</code>). Constraints: Maximum 80 characters; alphanumeric characters, hyphens (-), and underscores (_) are allowed.</p>\" \
            }, \
            \"AWSAccountIds\":{ \
              \"shape\":\"AWSAccountIdList\", \
              \"documentation\":\"<p>The AWS account number of the <a href=\\\"http://docs.aws.amazon.com/general/latest/gr/glos-chap.html#P\\\">principal</a> who will be given permission. The principal must have an AWS account, but does not need to be signed up for Amazon SQS. For information about locating the AWS account identification, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AWSCredentials.html\\\">Your AWS Identifiers</a> in the <i>Amazon SQS Developer Guide</i>.</p>\" \
            }, \
            \"Actions\":{ \
              \"shape\":\"ActionNameList\", \
              \"documentation\":\"<p>The action the client wants to allow for the specified principal. The following are valid values: <code>* | SendMessage | ReceiveMessage | DeleteMessage | ChangeMessageVisibility | GetQueueAttributes | GetQueueUrl</code>. For more information about these actions, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/acp-overview.html#PermissionTypes\\\">Understanding Permissions</a> in the <i>Amazon SQS Developer Guide</i>.</p> <p>Specifying <code>SendMessage</code>, <code>DeleteMessage</code>, or <code>ChangeMessageVisibility</code> for the <code>ActionName.n</code> also grants permissions for the corresponding batch versions of those actions: <code>SendMessageBatch</code>, <code>DeleteMessageBatch</code>, and <code>ChangeMessageVisibilityBatch</code>.</p>\" \
            } \
          } \
        }, \
        \"AttributeMap\":{ \
          \"type\":\"map\", \
          \"key\":{ \
            \"shape\":\"QueueAttributeName\", \
            \"documentation\":\"<p>The name of a queue attribute.</p>\", \
            \"locationName\":\"Name\" \
          }, \
          \"value\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The value of a queue attribute.</p>\", \
            \"locationName\":\"Value\" \
          }, \
          \"flattened\":true, \
          \"locationName\":\"Attribute\" \
        }, \
        \"AttributeNameList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"QueueAttributeName\", \
            \"locationName\":\"AttributeName\" \
          }, \
          \"flattened\":true \
        }, \
        \"BatchEntryIdsNotDistinct\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.BatchEntryIdsNotDistinct\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Two or more batch entries have the same <code>Id</code> in the request.</p>\" \
        }, \
        \"BatchRequestTooLong\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.BatchRequestTooLong\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The length of all the messages put together is more than the limit.</p>\" \
        }, \
        \"BatchResultErrorEntry\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Id\", \
            \"SenderFault\", \
            \"Code\" \
          ], \
          \"members\":{ \
            \"Id\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The id of an entry in a batch request.</p>\" \
            }, \
            \"SenderFault\":{ \
              \"shape\":\"Boolean\", \
              \"documentation\":\"<p>Whether the error happened due to the sender's fault.</p>\" \
            }, \
            \"Code\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An error code representing why the action failed on this entry.</p>\" \
            }, \
            \"Message\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>A message explaining why the action failed on this entry.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>This is used in the responses of batch API to give a detailed description of the result of an action on each entry in the request.</p>\" \
        }, \
        \"BatchResultErrorEntryList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"BatchResultErrorEntry\", \
            \"locationName\":\"BatchResultErrorEntry\" \
          }, \
          \"flattened\":true \
        }, \
        \"Binary\":{\"type\":\"blob\"}, \
        \"BinaryList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"Binary\", \
            \"locationName\":\"BinaryListValue\" \
          } \
        }, \
        \"Boolean\":{\"type\":\"boolean\"}, \
        \"ChangeMessageVisibilityBatchRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"Entries\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"Entries\":{ \
              \"shape\":\"ChangeMessageVisibilityBatchRequestEntryList\", \
              \"documentation\":\"<p>A list of receipt handles of the messages for which the visibility timeout must be changed.</p>\" \
            } \
          } \
        }, \
        \"ChangeMessageVisibilityBatchRequestEntry\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Id\", \
            \"ReceiptHandle\" \
          ], \
          \"members\":{ \
            \"Id\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An identifier for this particular receipt handle. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>\" \
            }, \
            \"ReceiptHandle\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>A receipt handle.</p>\" \
            }, \
            \"VisibilityTimeout\":{ \
              \"shape\":\"Integer\", \
              \"documentation\":\"<p>The new value (in seconds) for the message's visibility timeout.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Encloses a receipt handle and an entry id for each message in <a>ChangeMessageVisibilityBatch</a>. </p> <important> <p>All of the following parameters are list parameters that must be prefixed with <code>ChangeMessageVisibilityBatchRequestEntry.n</code>, where <code>n</code> is an integer value starting with 1. For example, a parameter list for this action might look like this:</p> </important> <p><code>&amp;ChangeMessageVisibilityBatchRequestEntry.1.Id=change_visibility_msg_2</code></p> <p><code>&amp;ChangeMessageVisibilityBatchRequestEntry.1.ReceiptHandle=<replaceable>Your_Receipt_Handle</replaceable></code></p> <p><code>&amp;ChangeMessageVisibilityBatchRequestEntry.1.VisibilityTimeout=45</code></p>\" \
        }, \
        \"ChangeMessageVisibilityBatchRequestEntryList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"ChangeMessageVisibilityBatchRequestEntry\", \
            \"locationName\":\"ChangeMessageVisibilityBatchRequestEntry\" \
          }, \
          \"flattened\":true \
        }, \
        \"ChangeMessageVisibilityBatchResult\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Successful\", \
            \"Failed\" \
          ], \
          \"members\":{ \
            \"Successful\":{ \
              \"shape\":\"ChangeMessageVisibilityBatchResultEntryList\", \
              \"documentation\":\"<p>A list of <a>ChangeMessageVisibilityBatchResultEntry</a> items.</p>\" \
            }, \
            \"Failed\":{ \
              \"shape\":\"BatchResultErrorEntryList\", \
              \"documentation\":\"<p>A list of <a>BatchResultErrorEntry</a> items.</p>\" \
            } \
          }, \
          \"documentation\":\"<p> For each message in the batch, the response contains a <a>ChangeMessageVisibilityBatchResultEntry</a> tag if the message succeeds or a <a>BatchResultErrorEntry</a> tag if the message fails. </p>\" \
        }, \
        \"ChangeMessageVisibilityBatchResultEntry\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Id\"], \
          \"members\":{ \
            \"Id\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Represents a message whose visibility timeout has been changed successfully.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Encloses the id of an entry in <a>ChangeMessageVisibilityBatch</a>.</p>\" \
        }, \
        \"ChangeMessageVisibilityBatchResultEntryList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"ChangeMessageVisibilityBatchResultEntry\", \
            \"locationName\":\"ChangeMessageVisibilityBatchResultEntry\" \
          }, \
          \"flattened\":true \
        }, \
        \"ChangeMessageVisibilityRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"ReceiptHandle\", \
            \"VisibilityTimeout\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"ReceiptHandle\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The receipt handle associated with the message whose visibility timeout should be changed. This parameter is returned by the <a>ReceiveMessage</a> action.</p>\" \
            }, \
            \"VisibilityTimeout\":{ \
              \"shape\":\"Integer\", \
              \"documentation\":\"<p>The new value (in seconds - from 0 to 43200 - maximum 12 hours) for the message's visibility timeout.</p>\" \
            } \
          } \
        }, \
        \"CreateQueueRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"QueueName\"], \
          \"members\":{ \
            \"QueueName\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The name for the queue to be created.</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"AttributeMap\", \
              \"documentation\":\"<p>A map of attributes with their corresponding values.</p> <p>The following lists the names, descriptions, and values of the special request parameters the <code>CreateQueue</code> action uses:</p> <p> <ul> <li> <code>DelaySeconds</code> - The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 (zero).</li> <li> <code>MaximumMessageSize</code> - The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB).</li> <li> <code>MessageRetentionPeriod</code> - The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days).</li> <li> <code>Policy</code> - The queue's policy. A valid form-url-encoded policy. For more information about policy structure, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/BasicStructure.html\\\">Basic Policy Structure</a> in the <i>Amazon SQS Developer Guide</i>. For more information about form-url-encoding, see <a href=\\\"http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1\\\">http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1</a>.</li> <li> <code>ReceiveMessageWaitTimeSeconds</code> - The time for which a <a>ReceiveMessage</a> call will wait for a message to arrive. An integer from 0 to 20 (seconds). The default for this attribute is 0. </li> <li> <code>VisibilityTimeout</code> - The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html\\\">Visibility Timeout</a> in the <i>Amazon SQS Developer Guide</i>.</li> </ul> </p>\", \
              \"locationName\":\"Attribute\" \
            } \
          } \
        }, \
        \"CreateQueueResult\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL for the created Amazon SQS queue.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Returns the QueueUrl element of the created queue.</p>\" \
        }, \
        \"DeleteMessageBatchRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"Entries\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"Entries\":{ \
              \"shape\":\"DeleteMessageBatchRequestEntryList\", \
              \"documentation\":\"<p>A list of receipt handles for the messages to be deleted.</p>\" \
            } \
          } \
        }, \
        \"DeleteMessageBatchRequestEntry\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Id\", \
            \"ReceiptHandle\" \
          ], \
          \"members\":{ \
            \"Id\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An identifier for this particular receipt handle. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>\" \
            }, \
            \"ReceiptHandle\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>A receipt handle.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Encloses a receipt handle and an identifier for it.</p>\" \
        }, \
        \"DeleteMessageBatchRequestEntryList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"DeleteMessageBatchRequestEntry\", \
            \"locationName\":\"DeleteMessageBatchRequestEntry\" \
          }, \
          \"flattened\":true \
        }, \
        \"DeleteMessageBatchResult\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Successful\", \
            \"Failed\" \
          ], \
          \"members\":{ \
            \"Successful\":{ \
              \"shape\":\"DeleteMessageBatchResultEntryList\", \
              \"documentation\":\"<p>A list of <a>DeleteMessageBatchResultEntry</a> items.</p>\" \
            }, \
            \"Failed\":{ \
              \"shape\":\"BatchResultErrorEntryList\", \
              \"documentation\":\"<p>A list of <a>BatchResultErrorEntry</a> items.</p>\" \
            } \
          }, \
          \"documentation\":\"<p> For each message in the batch, the response contains a <a>DeleteMessageBatchResultEntry</a> tag if the message is deleted or a <a>BatchResultErrorEntry</a> tag if the message cannot be deleted. </p>\" \
        }, \
        \"DeleteMessageBatchResultEntry\":{ \
          \"type\":\"structure\", \
          \"required\":[\"Id\"], \
          \"members\":{ \
            \"Id\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Represents a successfully deleted message.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Encloses the id an entry in <a>DeleteMessageBatch</a>.</p>\" \
        }, \
        \"DeleteMessageBatchResultEntryList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"DeleteMessageBatchResultEntry\", \
            \"locationName\":\"DeleteMessageBatchResultEntry\" \
          }, \
          \"flattened\":true \
        }, \
        \"DeleteMessageRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"ReceiptHandle\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"ReceiptHandle\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The receipt handle associated with the message to delete.</p>\" \
            } \
          } \
        }, \
        \"DeleteQueueRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"QueueUrl\"], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            } \
          } \
        }, \
        \"EmptyBatchRequest\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.EmptyBatchRequest\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Batch request does not contain an entry.</p>\" \
        }, \
        \"GetQueueAttributesRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"QueueUrl\"], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"AttributeNames\":{ \
              \"shape\":\"AttributeNameList\", \
              \"documentation\":\"<p>A list of attributes to retrieve information for. </p>\" \
            } \
          } \
        }, \
        \"GetQueueAttributesResult\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Attributes\":{ \
              \"shape\":\"AttributeMap\", \
              \"documentation\":\"<p>A map of attributes to the respective values.</p>\", \
              \"locationName\":\"Attribute\" \
            } \
          }, \
          \"documentation\":\"A list of returned queue attributes.\" \
        }, \
        \"GetQueueUrlRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"QueueName\"], \
          \"members\":{ \
            \"QueueName\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The name of the queue whose URL must be fetched. Maximum 80 characters; alphanumeric characters, hyphens (-), and underscores (_) are allowed.</p>\" \
            }, \
            \"QueueOwnerAWSAccountId\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The AWS account ID of the account that created the queue.</p>\" \
            } \
          } \
        }, \
        \"GetQueueUrlResult\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL for the queue.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/UnderstandingResponses.html\\\">Responses</a> in the <i>Amazon SQS Developer Guide</i>.</p>\" \
        }, \
        \"Integer\":{\"type\":\"integer\"}, \
        \"InvalidAttributeName\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The attribute referred to does not exist.</p>\" \
        }, \
        \"InvalidBatchEntryId\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.InvalidBatchEntryId\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The <code>Id</code> of a batch entry in a batch request does not abide by the specification.</p>\" \
        }, \
        \"InvalidIdFormat\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The receipt handle is not valid for the current version.</p>\" \
        }, \
        \"InvalidMessageContents\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The message contains characters outside the allowed set.</p>\" \
        }, \
        \"ListDeadLetterSourceQueuesRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"QueueUrl\"], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"The queue URL of a dead letter queue.\" \
            } \
          } \
        }, \
        \"ListDeadLetterSourceQueuesResult\":{ \
          \"type\":\"structure\", \
          \"required\":[\"queueUrls\"], \
          \"members\":{ \
            \"queueUrls\":{ \
              \"shape\":\"QueueUrlList\", \
              \"documentation\":\"A list of source queue URLs that have the RedrivePolicy queue attribute configured with a dead letter queue.\" \
            } \
          }, \
          \"documentation\":\"A list of your dead letter source queues.\" \
        }, \
        \"ListQueuesRequest\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"QueueNamePrefix\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>A string to use for filtering the list results. Only those queues whose name begins with the specified string are returned.</p>\" \
            } \
          } \
        }, \
        \"ListQueuesResult\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"QueueUrls\":{ \
              \"shape\":\"QueueUrlList\", \
              \"documentation\":\"<p>A list of queue URLs, up to 1000 entries.</p>\" \
            } \
          }, \
          \"documentation\":\"A list of your queues.\" \
        }, \
        \"Message\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"MessageId\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>A unique identifier for the message. Message IDs are considered unique across all AWS accounts for an extended period of time.</p>\" \
            }, \
            \"ReceiptHandle\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An identifier associated with the act of receiving the message. A new receipt handle is returned every time you receive a message. When deleting a message, you provide the last received receipt handle to delete the message.</p>\" \
            }, \
            \"MD5OfBody\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An MD5 digest of the non-URL-encoded message body string.</p>\" \
            }, \
            \"Body\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The message's contents (not URL-encoded).</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"AttributeMap\", \
              \"documentation\":\"<p><code>SenderId</code>, <code>SentTimestamp</code>, <code>ApproximateReceiveCount</code>, and/or <code>ApproximateFirstReceiveTimestamp</code>. <code>SentTimestamp</code> and <code>ApproximateFirstReceiveTimestamp</code> are each returned as an integer representing the <a href=\\\"http://en.wikipedia.org/wiki/Unix_time\\\">epoch time</a> in milliseconds.</p>\", \
              \"locationName\":\"Attribute\" \
            }, \
            \"MD5OfMessageAttributes\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href=\\\"http://www.faqs.org/rfcs/rfc1321.html\\\">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>\" \
            }, \
            \"MessageAttributes\":{ \
              \"shape\":\"MessageAttributeMap\", \
              \"documentation\":\"<p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV\\\">Message Attribute Items</a>.</p>\", \
              \"locationName\":\"MessageAttribute\" \
            } \
          }, \
          \"documentation\":\"<p>An Amazon SQS message.</p>\" \
        }, \
        \"MessageAttributeMap\":{ \
          \"type\":\"map\", \
          \"key\":{ \
            \"shape\":\"String\", \
            \"locationName\":\"Name\" \
          }, \
          \"value\":{ \
            \"shape\":\"MessageAttributeValue\", \
            \"locationName\":\"Value\" \
          }, \
          \"flattened\":true \
        }, \
        \"MessageAttributeName\":{\"type\":\"string\"}, \
        \"MessageAttributeNameList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"MessageAttributeName\", \
            \"locationName\":\"MessageAttributeName\" \
          }, \
          \"flattened\":true \
        }, \
        \"MessageAttributeValue\":{ \
          \"type\":\"structure\", \
          \"required\":[\"DataType\"], \
          \"members\":{ \
            \"StringValue\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Strings are Unicode with UTF8 binary encoding. For a list of code values, see <a href=\\\"http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters\\\">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.</p>\" \
            }, \
            \"BinaryValue\":{ \
              \"shape\":\"Binary\", \
              \"documentation\":\"<p>Binary type attributes can store any binary data, for example, compressed data, encrypted data, or images.</p>\" \
            }, \
            \"StringListValues\":{ \
              \"shape\":\"StringList\", \
              \"documentation\":\"<p>Not implemented. Reserved for future use.</p>\", \
              \"flattened\":true, \
              \"locationName\":\"StringListValue\" \
            }, \
            \"BinaryListValues\":{ \
              \"shape\":\"BinaryList\", \
              \"documentation\":\"<p>Not implemented. Reserved for future use.</p>\", \
              \"flattened\":true, \
              \"locationName\":\"BinaryListValue\" \
            }, \
            \"DataType\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Amazon SQS supports the following logical data types: String, Number, and Binary. In addition, you can append your own custom labels. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributes.DataTypes\\\">Message Attribute Data Types</a>.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>The user-specified message attribute value. For string data types, the value attribute has the same restrictions on the content as the message body. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_SendMessage.html\\\">SendMessage</a>.</p> <p>Name, type, and value must not be empty or null. In addition, the message body should not be empty or null. All parts of the message attribute, including name, type, and value, are included in the message size restriction, which is currently 256 KB (262,144 bytes).</p>\" \
        }, \
        \"MessageList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"Message\", \
            \"locationName\":\"Message\" \
          }, \
          \"flattened\":true \
        }, \
        \"MessageNotInflight\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.MessageNotInflight\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The message referred to is not in flight.</p>\" \
        }, \
        \"OverLimit\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"OverLimit\", \
            \"httpStatusCode\":403, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The action that you requested would violate a limit. For example, ReceiveMessage returns this error if the maximum number of messages inflight has already been reached. <a>AddPermission</a> returns this error if the maximum number of permissions for the queue has already been reached. </p>\" \
        }, \
        \"QueueAttributeName\":{ \
          \"type\":\"string\", \
          \"enum\":[ \
            \"Policy\", \
            \"VisibilityTimeout\", \
            \"MaximumMessageSize\", \
            \"MessageRetentionPeriod\", \
            \"ApproximateNumberOfMessages\", \
            \"ApproximateNumberOfMessagesNotVisible\", \
            \"CreatedTimestamp\", \
            \"LastModifiedTimestamp\", \
            \"QueueArn\", \
            \"ApproximateNumberOfMessagesDelayed\", \
            \"DelaySeconds\", \
            \"ReceiveMessageWaitTimeSeconds\", \
            \"RedrivePolicy\" \
          ] \
        }, \
        \"QueueDeletedRecently\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.QueueDeletedRecently\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>You must wait 60 seconds after deleting a queue before you can create another with the same name.</p>\" \
        }, \
        \"QueueDoesNotExist\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.NonExistentQueue\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The queue referred to does not exist.</p>\" \
        }, \
        \"QueueNameExists\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"QueueAlreadyExists\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>A queue already exists with this name. Amazon SQS returns this error only if the request includes attributes whose values differ from those of the existing queue.</p>\" \
        }, \
        \"QueueUrlList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"String\", \
            \"locationName\":\"QueueUrl\" \
          }, \
          \"flattened\":true \
        }, \
        \"ReceiptHandleIsInvalid\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>The receipt handle provided is not valid.</p>\" \
        }, \
        \"ReceiveMessageRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[\"QueueUrl\"], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"AttributeNames\":{ \
              \"shape\":\"AttributeNameList\", \
              \"documentation\":\"<p>A list of attributes that need to be returned along with each message. </p> <p> The following lists the names and descriptions of the attributes that can be returned: </p> <ul> <li> <code>All</code> - returns all values.</li> <li> <code>ApproximateFirstReceiveTimestamp</code> - returns the time when the message was first received (epoch time in milliseconds).</li> <li> <code>ApproximateReceiveCount</code> - returns the number of times a message has been received but not deleted.</li> <li> <code>SenderId</code> - returns the AWS account number (or the IP address, if anonymous access is allowed) of the sender.</li> <li> <code>SentTimestamp</code> - returns the time when the message was sent (epoch time in milliseconds).</li> </ul>\" \
            }, \
            \"MessageAttributeNames\":{ \
              \"shape\":\"MessageAttributeNameList\", \
              \"documentation\":\"<p>The message attribute Name can contain the following characters: A-Z, a-z, 0-9, underscore(_), hyphen(-), and period (.). The message attribute name must not start or end with a period, and it should not have successive periods. The message attribute name is case sensitive and must be unique among all attribute names for the message. The message attribute name can be up to 256 characters long. Attribute names cannot start with \\\"AWS.\\\" or \\\"Amazon.\\\" because these prefixes are reserved for use by Amazon Web Services.</p>\" \
            }, \
            \"MaxNumberOfMessages\":{ \
              \"shape\":\"Integer\", \
              \"documentation\":\"<p>The maximum number of messages to return. Amazon SQS never returns more messages than this value but may return fewer. Values can be from 1 to 10. Default is 1.</p> <p>All of the messages are not necessarily returned.</p>\" \
            }, \
            \"VisibilityTimeout\":{ \
              \"shape\":\"Integer\", \
              \"documentation\":\"<p>The duration (in seconds) that the received messages are hidden from subsequent retrieve requests after being retrieved by a <code>ReceiveMessage</code> request.</p>\" \
            }, \
            \"WaitTimeSeconds\":{ \
              \"shape\":\"Integer\", \
              \"documentation\":\"<p>The duration (in seconds) for which the call will wait for a message to arrive in the queue before returning. If a message is available, the call will return sooner than WaitTimeSeconds.</p>\" \
            } \
          } \
        }, \
        \"ReceiveMessageResult\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"Messages\":{ \
              \"shape\":\"MessageList\", \
              \"documentation\":\"<p>A list of messages.</p>\" \
            } \
          }, \
          \"documentation\":\"A list of received messages.\" \
        }, \
        \"RemovePermissionRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"Label\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"Label\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The identification of the permission to remove. This is the label added with the <a>AddPermission</a> action.</p>\" \
            } \
          } \
        }, \
        \"SendMessageBatchRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"Entries\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"Entries\":{ \
              \"shape\":\"SendMessageBatchRequestEntryList\", \
              \"documentation\":\"<p>A list of <a>SendMessageBatchRequestEntry</a> items.</p>\" \
            } \
          } \
        }, \
        \"SendMessageBatchRequestEntry\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Id\", \
            \"MessageBody\" \
          ], \
          \"members\":{ \
            \"Id\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An identifier for the message in this batch. This is used to communicate the result. Note that the <code>Id</code>s of a batch request need to be unique within the request.</p>\" \
            }, \
            \"MessageBody\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>Body of the message.</p>\" \
            }, \
            \"DelaySeconds\":{ \
              \"shape\":\"Integer\", \
              \"documentation\":\"<p>The number of seconds for which the message has to be delayed.</p>\" \
            }, \
            \"MessageAttributes\":{ \
              \"shape\":\"MessageAttributeMap\", \
              \"documentation\":\"<p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV\\\">Message Attribute Items</a>.</p>\", \
              \"locationName\":\"MessageAttribute\" \
            } \
          }, \
          \"documentation\":\"<p>Contains the details of a single Amazon SQS message along with a <code>Id</code>. </p>\" \
        }, \
        \"SendMessageBatchRequestEntryList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"SendMessageBatchRequestEntry\", \
            \"locationName\":\"SendMessageBatchRequestEntry\" \
          }, \
          \"flattened\":true \
        }, \
        \"SendMessageBatchResult\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Successful\", \
            \"Failed\" \
          ], \
          \"members\":{ \
            \"Successful\":{ \
              \"shape\":\"SendMessageBatchResultEntryList\", \
              \"documentation\":\"<p>A list of <a>SendMessageBatchResultEntry</a> items.</p>\" \
            }, \
            \"Failed\":{ \
              \"shape\":\"BatchResultErrorEntryList\", \
              \"documentation\":\"<p>A list of <a>BatchResultErrorEntry</a> items with the error detail about each message that could not be enqueued.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>For each message in the batch, the response contains a <a>SendMessageBatchResultEntry</a> tag if the message succeeds or a <a>BatchResultErrorEntry</a> tag if the message fails.</p>\" \
        }, \
        \"SendMessageBatchResultEntry\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"Id\", \
            \"MessageId\", \
            \"MD5OfMessageBody\" \
          ], \
          \"members\":{ \
            \"Id\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An identifier for the message in this batch.</p>\" \
            }, \
            \"MessageId\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An identifier for the message.</p>\" \
            }, \
            \"MD5OfMessageBody\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An MD5 digest of the non-URL-encoded message body string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href=\\\"http://www.faqs.org/rfcs/rfc1321.html\\\">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>\" \
            }, \
            \"MD5OfMessageAttributes\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message batch correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href=\\\"http://www.faqs.org/rfcs/rfc1321.html\\\">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>\" \
            } \
          }, \
          \"documentation\":\"<p>Encloses a message ID for successfully enqueued message of a <a>SendMessageBatch</a>.</p>\" \
        }, \
        \"SendMessageBatchResultEntryList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"SendMessageBatchResultEntry\", \
            \"locationName\":\"SendMessageBatchResultEntry\" \
          }, \
          \"flattened\":true \
        }, \
        \"SendMessageRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"MessageBody\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"MessageBody\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The message to send. String maximum 256 KB in size. For a list of allowed characters, see the preceding important note.</p>\" \
            }, \
            \"DelaySeconds\":{ \
              \"shape\":\"Integer\", \
              \"documentation\":\"<p> The number of seconds (0 to 900 - 15 minutes) to delay a specific message. Messages with a positive <code>DelaySeconds</code> value become available for processing after the delay time is finished. If you don't specify a value, the default value for the queue applies. </p>\" \
            }, \
            \"MessageAttributes\":{ \
              \"shape\":\"MessageAttributeMap\", \
              \"documentation\":\"<p>Each message attribute consists of a Name, Type, and Value. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/SQSMessageAttributes.html#SQSMessageAttributesNTV\\\">Message Attribute Items</a>.</p>\", \
              \"locationName\":\"MessageAttribute\" \
            } \
          } \
        }, \
        \"SendMessageResult\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
            \"MD5OfMessageBody\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An MD5 digest of the non-URL-encoded message body string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href=\\\"http://www.faqs.org/rfcs/rfc1321.html\\\">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>\" \
            }, \
            \"MD5OfMessageAttributes\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>An MD5 digest of the non-URL-encoded message attribute string. This can be used to verify that Amazon SQS received the message correctly. Amazon SQS first URL decodes the message before creating the MD5 digest. For information about MD5, go to <a href=\\\"http://www.faqs.org/rfcs/rfc1321.html\\\">http://www.faqs.org/rfcs/rfc1321.html</a>.</p>\" \
            }, \
            \"MessageId\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p> An element containing the message ID of the message sent to the queue. For more information, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/ImportantIdentifiers.html\\\">Queue and Message Identifiers</a> in the <i>Amazon SQS Developer Guide</i>. </p>\" \
            } \
          }, \
          \"documentation\":\"<p>The MD5OfMessageBody and MessageId elements.</p>\" \
        }, \
        \"SetQueueAttributesRequest\":{ \
          \"type\":\"structure\", \
          \"required\":[ \
            \"QueueUrl\", \
            \"Attributes\" \
          ], \
          \"members\":{ \
            \"QueueUrl\":{ \
              \"shape\":\"String\", \
              \"documentation\":\"<p>The URL of the Amazon SQS queue to take action on.</p>\" \
            }, \
            \"Attributes\":{ \
              \"shape\":\"AttributeMap\", \
              \"documentation\":\"<p>A map of attributes to set.</p> <p>The following lists the names, descriptions, and values of the special request parameters the <code>SetQueueAttributes</code> action uses:</p> <p> <ul> <li> <code>DelaySeconds</code> - The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 (zero).</li> <li> <code>MaximumMessageSize</code> - The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB).</li> <li> <code>MessageRetentionPeriod</code> - The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days).</li> <li> <code>Policy</code> - The queue's policy. A valid form-url-encoded policy. For more information about policy structure, see <a href=\\\"http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/BasicStructure.html\\\">Basic Policy Structure</a> in the <i>Amazon SQS Developer Guide</i>. For more information about form-url-encoding, see <a href=\\\"http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1\\\">http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1</a>.</li> <li> <code>ReceiveMessageWaitTimeSeconds</code> - The time for which a ReceiveMessage call will wait for a message to arrive. An integer from 0 to 20 (seconds). The default for this attribute is 0. </li> <li> <code>VisibilityTimeout</code> - The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30. For more information about visibility timeout, see Visibility Timeout in the <i>Amazon SQS Developer Guide</i>.</li> <li> <code>RedrivePolicy</code> - The parameters for dead letter queue functionality of the source queue. For more information about RedrivePolicy and dead letter queues, see Using Amazon SQS Dead Letter Queues in the <i>Amazon SQS Developer Guide</i>.</li> </ul> </p>\", \
              \"locationName\":\"Attribute\" \
            } \
          } \
        }, \
        \"String\":{\"type\":\"string\"}, \
        \"StringList\":{ \
          \"type\":\"list\", \
          \"member\":{ \
            \"shape\":\"String\", \
            \"locationName\":\"StringListValue\" \
          } \
        }, \
        \"TooManyEntriesInBatchRequest\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.TooManyEntriesInBatchRequest\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Batch request contains more number of entries than permissible.</p>\" \
        }, \
        \"UnsupportedOperation\":{ \
          \"type\":\"structure\", \
          \"members\":{ \
          }, \
          \"error\":{ \
            \"code\":\"AWS.SimpleQueueService.UnsupportedOperation\", \
            \"httpStatusCode\":400, \
            \"senderFault\":true \
          }, \
          \"exception\":true, \
          \"documentation\":\"<p>Error code 400. Unsupported operation.</p>\" \
        } \
      } \
    } \
     \
    ";
}

@end
