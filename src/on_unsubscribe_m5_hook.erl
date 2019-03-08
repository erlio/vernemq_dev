%% @hidden
-module(on_unsubscribe_m5_hook).
-include("vernemq_dev_int.hrl").

%% called as an 'all'-hook, return value is ignored
-callback on_unsubscribe_m5(UserName      :: username(),
                            SubscriberId  :: subscriber_id(),
                            Topics        :: [Topic :: topic()],
                            Properties    :: unsub_properties()) ->
    ok |
    {ok, unsub_modifiers()} |
    next.

-type unsub_properties() ::
        #{
          p_user_property => nonempty_list(user_property())
         }.

-type unsub_modifiers() ::
        #{
          %% Change the topics which will be unsubscribed.
          topics => [topic()]
         }.
