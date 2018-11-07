%% @hidden
-module(auth_on_publish_m5_hook).
-include("vernemq_dev_int.hrl").
-callback auth_on_publish_m5(UserName      :: username(),
                             SubscriberId  :: subscriber_id(),
                             QoS           :: qos(),
                             Topic         :: topic(),
                             Payload       :: payload(),
                             IsRetain      :: flag(),
                             Properties    :: pub_properties()) ->
    ok |
    {ok, Payload    :: payload()} |
    {ok, Modifiers  :: msg_modifier()} |
    {error, error_values()} |
    {error, Reason  :: atom()} | %% will be turned into ?NOT_AUTHORIZED
    next.

-type pub_properties() ::
        #{
          p_payload_format_indicator => unspecified | utf8,
          p_message_expiry_interval => seconds(),
          p_content_type => utf8string(),
          p_response_topic => topic(),
          p_correlation_data => binary(),
          p_topic_alias => 1..65535,
          p_user_property => [user_property()]
         }.

-type msg_modifier() ::
        #{
           topic => topic(),
           payload => payload(),
           reg_view => reg_view(),
           qos => qos(),
           retain => flag(),
           mountpoint => mountpoint()
         }.


-type error_values() ::
        #{
           reason_code => reason_code_name()
         }.

-export_type([msg_modifier/0]).
